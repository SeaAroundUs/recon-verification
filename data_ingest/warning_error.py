from django.db import connection


# base class used by all views providing some common functionality
class ReconView:
    @classmethod
    def view_name(cls):
        return cls.prefix + cls.view

    @classmethod
    def all(cls):
        with connection.cursor() as cursor:
            cursor.execute("SELECT rule_id FROM recon.validation_rule WHERE name='%s'"
                           % cls.view_name())
            if cursor.rowcount == 0:
                return []
            else:
                cursor.execute("SELECT id FROM recon.validation_result WHERE rule_id = %s;"
                               % int(cursor.fetchone()[0]))
                return cursor.fetchall()

    @classmethod
    def any(cls, ids):
        with connection.cursor() as cursor:
            cursor.execute("SELECT rule_id FROM recon.validation_rule WHERE name='%s'"
                           % cls.view_name())
            if cursor.rowcount == 0:
                return []
            else:
                cursor.execute('SELECT id FROM recon.validation_result WHERE rule_id = %s AND id IN (%s);'
                               % (int(cursor.fetchone()[0]), ','.join(map(str, ids))))
                return cursor.fetchall()

    @classmethod
    def count(cls):
        with connection.cursor() as cursor:
            cursor.execute("SELECT rule_id FROM recon.validation_rule WHERE name='%s'"
                           % cls.view_name())
            if cursor.rowcount == 0:
                return 0
            else:
                cursor.execute('SELECT count(1) FROM recon.validation_result WHERE rule_id = %s;'
                               % int(cursor.fetchone()[0]))
                return cursor.fetchone()[0]

    @classmethod
    def update(cls):
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM recon.refresh_validation_result_partition('%s')"
                            % cls.view_name())
            if cursor.rowcount == 0:
                return ""
            else:
                return cursor.fetchone()[0]


    @classmethod
    def executed(cls):
        with connection.cursor() as cursor:
            cursor.execute("SELECT to_char(last_executed, 'YYYY-MM-DD HH24:MI') FROM recon.validation_rule WHERE name='%s'"
                            % cls.view_name())
            if cursor.rowcount == 0:
                return ""
            else:
                return cursor.fetchone()[0]


# the next two classes are marker pattern classes indicating raw_catch or catch
class RawCatchMixin:
    prefix = 'v_raw_catch_'


class CatchMixin:
    prefix = 'v_catch_'


class DistributionMixin:
    prefix = 'v_distribution_'

# the next two classes are marker pattern classes indicating warning or error
class WarningView(ReconView):
    type = "warning"


class ErrorView(ReconView):
    type = "error"


# base classes for error views. these classes shouldn't be used for anything but
# creation of the class list at the bottom
class AmountZeroOrNegative(ErrorView):
    message = "Catch amount is zero or negative"
    view = "amount_zero_or_negative"
    col = "amount"


class FishingEntityAndEEZNotAligned(ErrorView):
    message = "Layer is incorrect (determined by EEZ, Fishing Entity, and Taxon)"
    view = "fishing_entity_and_eez_not_aligned"
    col = "layer"


class InputReconstructedReportingStatusReported(ErrorView):
    message = "Input type is reconstructed and Reporting status is reported"
    view = "input_reconstructed_reporting_status_reported"
    col = "input_type_id"


class InputNotReconstructedReportingStatusUnreported(ErrorView):
    message = "Input type is not reconstructed and Reporting status is unreported"
    view = "input_not_reconstructed_reporting_status_unreported"
    col = "input_type_id"


class LayerNotInRange(ErrorView):
    message = "Unknown layer"
    view = "layer_not_in_range"
    col = "layer"


class LookupMismatch(ErrorView):
    message = "Lookup table mismatch"
    view = "lookup_mismatch"
    col = None


class MissingRequiredField(ErrorView):
    message = "Missing required field"
    view = "missing_required_field"
    col = None


class TaxaIsRare(ErrorView):
    message = "Rare taxa should be excluded"
    view = "taxa_is_rare"
    col = "taxon_key"


class AntarcticCCAMLRNull(ErrorView):
    message = "CCAMLR null for FAO 48, 58 or 88"
    view = "antarctic_ccamlr_null"
    col = "ccamlr_area"


class OutsideAntarcticCCAMLRNotNull(ErrorView):
    message = "CCAMLR not null for catch outside of the Antarctic"
    view = "outside_antarctic_ccamlr_not_null"
    col = "ccamlr_area"


class CCAMLRComboMismatch(ErrorView):
    message = "CCAMLR combo does not exist"
    view = "ccamlr_combo_mismatch"
    col = "ccamlr_area"
    

class ICESNull(ErrorView):
    message = "ICES area null for FAO 27"
    view = "ices_null"
    col = "ices_area"
    
    
class OutsideICESNotNull(ErrorView):
    message = "ICES area not null for catch outside of FAO 27"
    view = "outside_ices_not_null"
    col = "ices_area"    
    

class NAFONull(ErrorView):
    message = "NAFO area null for FAO 21"
    view = "nafo_null"
    col = "nafo_division" 
    
    
class OutsideNAFONotNull(ErrorView):
    message = "NAFO area not null for catch outside of FAO 21"
    view = "outside_nafo_not_null"
    col = "nafo_division"
    

class IcesComboMismatch(ErrorView):
    message = "ICES combo does not exist"
    view = "ices_combo_mismatch"
    col = "ices_area"
    
    
class NafoComboMismatch(ErrorView):
    message = "NAFO combo does not exist"
    view = "nafo_combo_mismatch"
    col = "nafo_division"
    
    
class EezIcesComboIfaMismatch(ErrorView):
    message = "The EEZ and ICES combination for small-scale catch does not occur in an IFA area"
    view = "eez_ices_combo_ifa_mismatch"
    col = "ices_area"
    
class EezNafoComboIfaMismatch(ErrorView):
    message = "The EEZ and NAFO combination for small-scale catch does not occur in an IFA area"
    view = "eez_nafo_combo_ifa_mismatch"
    col = "nafo_division"
    
class CcamlrComboIfaMismatch(ErrorView):
    message = "The EEZ and CCAMLR combination for small-scale catch does not occur in an IFA area"
    view = "eez_ccamlr_combo_ifa_mismatch"
    col = "ccamlr_area"

class CheckAssessAgreements(ErrorView):
    message = "Access agreements, Fishing entity and EEZ not existing"
    view = "check_access_agreements"
    col = ""

class CheckFishingEntityHomeEEZ(ErrorView):
    message = "EEZ in Layer 1 with different Home EEZ"
    view = "check_fishing_entity_home_eez"
    col = ""

class CheckExistFishingEntityEEZ(ErrorView):
    message = "Fishing Entity and EEZ not existing"
    view = "check_exist_fishing_entity_eez"
    col = ""

class TaxonKeysExisting(ErrorView):
    message = "Taxon key not existing in taxon table"
    view = "taxonkeys_existing"
    col = ""

class CheckNAFO(ErrorView):
    message = "NAFO Division not existing"
    view = "check_nafo"
    col = ""

class LayerSector(ErrorView):
    message = "Layer 3 with sector type industrial"
    view = "layer_sector"
    col = ""

class CheckNAFOIFA(ErrorView):
    message = "Sector Type Industrial and NAFO Division True Excluding NAFO combo with both is_ifa true and false"
    view = "check_nafo_ifa"
    col = ""

class CheckEEZIFA(ErrorView):
    message = "Sector Type Industrial fishing in IFA"
    view = "check_eez_ifa"
    col = ""

class HighSeasMismatch(ErrorView):
    message = "High Seas ID mismatch"
    view = "high_seas_mismatch"
    col = "eez"
    

class NoCorrespondingAaFound(ErrorView):
    message = "No matching access agreement records found"
    view = "no_corresponding_aa_found"
    col = "none"


class TaxonLatNorthNull(ErrorView):
    message = "Distribution.taxon_habitat record with lat_north is null"
    view = "taxon_lat_north_null"
    col = "taxon_key"


class TaxonLatSouthNull(ErrorView):
    message = "Distribution.taxon_habitat record with lat_south is null"
    view = "taxon_lat_south_null"
    col = "taxon_key"


class TaxonMinDepthNull(ErrorView):
    message = "Distribution.taxon_habitat record with min_depth is null"
    view = "taxon_min_depth_null"
    col = "taxon_key"


class TaxonMaxDepthNull(ErrorView):
    message = "Distribution.taxon_habitat record with max_depth is null"
    view = "taxon_max_depth_null"
    col = "taxon_key"


class TaxonSlMaxNull(ErrorView):
    message = "Distribution.taxon_habitat record with sl_max is null"
    view = "taxon_sl_max_null"
    col = "taxon_key"


class TaxonHabitatFaoNotOverlapExtent(ErrorView):
    message = "Distribution.taxon_habitat record found_in_fao_area_id not overlapping with taxon extent"
    view = "taxon_habitat_fao_not_overlap_extent"
    col = "taxon_key"


class TaxonExtentAvailableButNoHabitat(ErrorView):
    message = "Distribution.taxon_extent record available, but no corresponding taxon habitat found"
    view = "taxon_extent_available_but_no_habitat"
    col = "taxon_key"
    
    
class TaxonExtentAvailableButNoDistribution(ErrorView):
    message = "Distribution.taxon_extent record available, but no distribution generated yet"
    view = "taxon_extent_available_but_no_distribution"
    col = "taxon_key"
    
    
class TaxaHasNoDistributionLowRawCatch(ErrorView):
    message = "Distribution.taxon_distribution record unavailable, but raw catch <= 1000 (add taxa to substitute table)"
    view = "taxa_has_no_distribution_low_raw_catch"
    col = "taxon_key"


class TaxaHasNoDistributionHighRawCatch(ErrorView):
    message = "Distribution.taxon_distribution record unavailable and raw catch > 1000 (create extent/distribution)"
    view = "taxa_has_no_distribution_high_raw_catch"
    col = "taxon_key"
    
class TaxaHasSubstituteHighRawCatch(ErrorView):
    message = "Distribution.taxon_distribution_substitute available and raw catch > 1000 (create extent/distribution)"
    view = "taxa_has_substitute_high_raw_catch"
    col = "taxon_key"    
    
class TaxaSubstituteHasDistribution(ErrorView):
    message = "Distribution.taxon_distribution_substitute original key already has a distribution, consider removing it from the table"
    view = "taxa_substitute_has_distribution"
    col = "original_taxon_key" 

class TaxaSubstituteHasNoDistribution(ErrorView):
    message = "Distribution.taxon_distribution_substitute suggested key does not have a distribution"
    view = "taxa_substitute_has_no_distribution"
    col = "use_this_taxon_key_instead" 

class TaxaOverrideHasDistribution(ErrorView):
    message = "Distribution.taxon_distribution_substitute original key with manual override has a distribution"
    view = "taxa_override_has_distribution"
    col = "original_taxon_key" 

# base classes for warning views. these classes shouldn't be used for anything but
# creation of the class list at the bottom
class Layer2Or3AndSectorNotIndustrial(WarningView):
    message = "Layer is 2 or 3 and Sector is not industrial"
    view = "layer_2_or_3_and_sector_not_industrial"
    col = "layer"


class AmountGreaterThanThreshold(WarningView):
    message = "Amount > 5e6"
    view = "amount_greater_than_threshold"
    col = "amount"


class OriginalCountryFishingNotNull(WarningView):
    message = "Original country fishing is not null"
    view = "original_country_fishing_not_null"
    col = "original_country_fishing"


class OriginalSectorNotNull(WarningView):
    message = "Original sector is not null"
    view = "original_sector_not_null"
    col = "original_sector"


class OriginalTaxonNotNull(WarningView):
    message = "Original taxon name is not null"
    view = "original_taxon_not_null"
    col = "original_taxon_name"


class PeruCatchAmountGreaterThanThreshold(WarningView):
    message = "Amount > 15e6 (Peru)"
    view = "peru_catch_amount_greater_than_threshold"
    col = "amount"


class SubsistenceAndLayerNot1(WarningView):
    message = "Sector is subsistence and Layer is not 1"
    view = "subsistence_and_layer_not_1"
    col = "layer"


class YearMax(WarningView):
    message = "Year greater than the max year"
    view = "year_max"
    col = "year"

class TaxaSubstituteHasDifferentFunctionalGroups(WarningView):
    message = "Distribution.taxon_distribution_substitute original key and the substitute have different FunctionalGroupIDs and may interfere with Access Agreements"
    view = "taxa_substitute_has_different_functional_groups"
    col = "original_taxon_key" 

# these are the classes that should be consumed by the app's logic
class RawCatchAmountGreaterThanThreshold(AmountGreaterThanThreshold, RawCatchMixin): pass
class RawCatchAmountZeroOrNegative(AmountZeroOrNegative, RawCatchMixin): pass
class RawCatchFishingEntityAndEEZNotAligned(FishingEntityAndEEZNotAligned, RawCatchMixin): pass
class RawCatchInputReconstructedReportingStatusReported(InputReconstructedReportingStatusReported, RawCatchMixin): pass
class RawCatchInputNotReconstructedReportingStatusUnreported(InputNotReconstructedReportingStatusUnreported, RawCatchMixin): pass
class RawCatchLayer2Or3AndSectorNotIndustrial(Layer2Or3AndSectorNotIndustrial, RawCatchMixin): pass
class RawCatchLayerNotInRange(LayerNotInRange, RawCatchMixin): pass
class RawCatchLookupMismatch(LookupMismatch, RawCatchMixin): pass
class RawCatchMissingRequiredField(MissingRequiredField, RawCatchMixin): pass
class RawCatchOriginalCountryFishingNotNull(OriginalCountryFishingNotNull, RawCatchMixin): pass
class RawCatchOriginalSectorNotNull(OriginalSectorNotNull, RawCatchMixin): pass
class RawCatchOriginalTaxonNotNull(OriginalTaxonNotNull, RawCatchMixin): pass
class RawCatchPeruCatchAmountGreaterThanThreshold(PeruCatchAmountGreaterThanThreshold, RawCatchMixin): pass
class RawCatchSubsistenceAndLayerNot1(SubsistenceAndLayerNot1, RawCatchMixin): pass
class RawCatchTaxaIsRare(TaxaIsRare, RawCatchMixin): pass
class RawCatchYearMax(YearMax, RawCatchMixin): pass
class RawCatchAntarcticCCAMLRNull(AntarcticCCAMLRNull, RawCatchMixin): pass
class RawCatchOutsideAntarcticCCAMLRNotNull(OutsideAntarcticCCAMLRNotNull, RawCatchMixin): pass
class RawCatchCCAMLRComboMismatch(CCAMLRComboMismatch, RawCatchMixin): pass
class RawCatchHighSeasMismatch(HighSeasMismatch, RawCatchMixin): pass
class RawCatchICESNull(ICESNull, RawCatchMixin): pass
class RawCatchOutsideICESNotNull(OutsideICESNotNull, RawCatchMixin): pass
class RawCatchNAFONull(NAFONull, RawCatchMixin): pass
class RawCatchOutsideNAFONotNull(OutsideNAFONotNull, RawCatchMixin): pass
class RawCatchIcesComboMismatch(IcesComboMismatch, RawCatchMixin): pass
class RawCatchNafoComboMismatch(NafoComboMismatch, RawCatchMixin): pass
class RawCatchEezIcesComboIfaMismatch(EezIcesComboIfaMismatch, RawCatchMixin): pass
class RawCatchEezNafoComboIfaMismatch(EezNafoComboIfaMismatch, RawCatchMixin): pass
class RawCatchEezCcamlrComboIfaMismatch(CcamlrComboIfaMismatch, RawCatchMixin): pass

class RawCatchCheckAssessAgreements(CheckAssessAgreements, RawCatchMixin): pass
class RawCatchCheckFishingEntityHomeEEZ(CheckFishingEntityHomeEEZ, RawCatchMixin): pass
class RawCatchCheckExistFishingEntityEEZ(CheckExistFishingEntityEEZ, RawCatchMixin): pass
class RawCatchTaxonKeysExisting(TaxonKeysExisting, RawCatchMixin): pass
class RawCatchCheckNAFO(CheckNAFO, RawCatchMixin): pass
class RawCatchLayerSector(LayerSector, RawCatchMixin): pass
class RawCatchCheckNAFOIFA(CheckNAFOIFA, RawCatchMixin): pass
class RawCatchCheckEEZIFA(CheckEEZIFA, RawCatchMixin): pass
                              
                                               
class CatchAmountGreaterThanThreshold(AmountGreaterThanThreshold, CatchMixin): pass
class CatchAmountZeroOrNegative(AmountZeroOrNegative, CatchMixin): pass
class CatchFishingEntityAndEEZNotAligned(FishingEntityAndEEZNotAligned, CatchMixin): pass
class CatchInputReconstructedReportingStatusReported(InputReconstructedReportingStatusReported, CatchMixin): pass
class CatchInputNotReconstructedReportingStatusUnreported(InputNotReconstructedReportingStatusUnreported, CatchMixin): pass
class CatchLayer2Or3AndSectorNotIndustrial(Layer2Or3AndSectorNotIndustrial, CatchMixin): pass
class CatchLayerNotInRange(LayerNotInRange, CatchMixin): pass
class CatchOriginalCountryFishingNotNull(OriginalCountryFishingNotNull, CatchMixin): pass
class CatchOriginalSectorNotNull(OriginalSectorNotNull, CatchMixin): pass
class CatchOriginalTaxonNotNull(OriginalTaxonNotNull, CatchMixin): pass
class CatchPeruCatchAmountGreaterThanThreshold(PeruCatchAmountGreaterThanThreshold, CatchMixin): pass
class CatchSubsistenceAndLayerNot1(SubsistenceAndLayerNot1, CatchMixin): pass
class CatchTaxaIsRare(TaxaIsRare, CatchMixin): pass
class CatchYearMax(YearMax, CatchMixin): pass
class CatchNoCorrespondingAaFound(NoCorrespondingAaFound, CatchMixin): pass
class CatchAntarcticCCAMLRNull(AntarcticCCAMLRNull, CatchMixin): pass
class CatchOutsideAntarcticCCAMLRNotNull(OutsideAntarcticCCAMLRNotNull, CatchMixin): pass
class CatchCCAMLRComboMismatch(CCAMLRComboMismatch, CatchMixin): pass
class CatchICESNull(ICESNull, CatchMixin): pass
class CatchOutsideICESNotNull(OutsideICESNotNull, CatchMixin): pass
class CatchNAFONull(NAFONull, CatchMixin): pass
class CatchOutsideNAFONotNull(OutsideNAFONotNull, CatchMixin): pass


class DistributionTaxonLatNorthNull(TaxonLatNorthNull, DistributionMixin): pass
class DistributionTaxonLatSouthNull(TaxonLatSouthNull, DistributionMixin): pass
class DistributionTaxonMinDepthNull(TaxonMinDepthNull, DistributionMixin): pass
class DistributionTaxonMaxDepthNull(TaxonMaxDepthNull, DistributionMixin): pass
class DistributionTaxonHabitatFaoNotOverlapExtent(TaxonHabitatFaoNotOverlapExtent, DistributionMixin): pass
class DistributionTaxonExtentAvailableButNoHabitat(TaxonExtentAvailableButNoHabitat, DistributionMixin): pass
class DistributionTaxonExtentAvailableButNoDistribution(TaxonExtentAvailableButNoDistribution, DistributionMixin): pass
class DistributionTaxaHasNoDistributionLowRawCatch(TaxaHasNoDistributionLowRawCatch, DistributionMixin): pass
class DistributionTaxaHasNoDistributionHighRawCatch(TaxaHasNoDistributionHighRawCatch, DistributionMixin): pass
class DistributionTaxaHasSubstituteHighRawCatch(TaxaHasSubstituteHighRawCatch, DistributionMixin): pass
class DistributionTaxaSubstituteHasDistribution(TaxaSubstituteHasDistribution, DistributionMixin): pass
class DistributionTaxaSubstituteHasNoDistribution(TaxaSubstituteHasNoDistribution, DistributionMixin): pass
class DistributionTaxaOverrideHasDistribution(TaxaOverrideHasDistribution, DistributionMixin): pass
class DistributionTaxaSubstituteHasDifferentFunctionalGroups(TaxaSubstituteHasDifferentFunctionalGroups, DistributionMixin): pass
class DistributionTaxonSlMaxNull(TaxonSlMaxNull, DistributionMixin): pass