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
            if cursor.description is None:
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
            if cursor.description is None:
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
            if cursor.description is None:
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
            if cursor.description is None:
                return ""
            else:
                return cursor.fetchone()[0]


    @classmethod
    def executed(cls):
        with connection.cursor() as cursor:
            cursor.execute("SELECT to_char(last_executed, 'YYYY-MM-DD HH24:MI') FROM recon.validation_rule WHERE name='%s'"
                            % cls.view_name())
            if cursor.description is None:
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


# base classes for error views. these classes shouldn't be used for anythign but
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


class NoCorrespondingAaFound(ErrorView):
    message = "No matching access agreement records found"
    view = "no_corresponding_aa_found"
    col = "none"


class TaxonLatNorthNull(ErrorView):
    message = "Master.taxon record with lat_north is null"
    view = "taxon_lat_north_null"
    col = "taxon_key"


class TaxonLatSouthNull(ErrorView):
    message = "Master.taxon record with lat_south is null"
    view = "taxon_lat_south_null"
    col = "taxon_key"


class TaxonMinDepthNull(ErrorView):
    message = "Master.taxon record with min_depth is null"
    view = "taxon_min_depth_null"
    col = "taxon_key"


class TaxonMaxDepthNull(ErrorView):
    message = "Master.taxon record with max_depth is null"
    view = "taxon_max_depth_null"
    col = "taxon_key"


class TaxonHabitatFaoNotOverlapExtent(ErrorView):
    message = "Distribution.taxon_habitat record found_in_fao_area_id not overlapping with taxon extent"
    view = "taxon_habitat_fao_not_overlap_extent"
    col = "taxon_key"


class TaxonExtentAvailableButNoHabitat(ErrorView):
    message = "Distribution.taxon_extent record available, but no corresponding taxon habitat found"
    view = "taxon_extent_available_but_no_habitat"
    col = "taxon_key"


# base classes for warning views. these classes shouldn't be used for anythign but
# creation of the class list at the bottom
class Layer2Or3AndSectorNotIndustrial(WarningView):
    message = "Layer is 2 or 3 and Sector is not industrial"
    view = "layer_2_or_3_and_sector_not_industrial"
    col = "layer"


class AmountGreaterThanThreshold(WarningView):
    message = "Amount > 5e6"
    view = "amount_greater_than_threshold"
    col = "amount"


class FAO21NAFONull(WarningView):
    message = "Null NAFO for FAO 21"
    view = "fao_21_nafo_null"
    col = "nafo_division_id"


class FAO27ICESNull(WarningView):
    message = "Null ICES for FAO 27"
    view = "fao_27_ices_null"
    col = "ices_area_id"


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


# these are the classes that should be consumed by the app's logic
class RawCatchAmountGreaterThanThreshold(AmountGreaterThanThreshold, RawCatchMixin): pass
class RawCatchAmountZeroOrNegative(AmountZeroOrNegative, RawCatchMixin): pass
class RawCatchFAO21NAFONull(FAO21NAFONull, RawCatchMixin): pass
class RawCatchFAO27ICESNull(FAO27ICESNull, RawCatchMixin): pass
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


class CatchAmountGreaterThanThreshold(AmountGreaterThanThreshold, CatchMixin): pass
class CatchAmountZeroOrNegative(AmountZeroOrNegative, CatchMixin): pass
class CatchFAO21NAFONull(FAO21NAFONull, CatchMixin): pass
class CatchFAO27ICESNull(FAO27ICESNull, CatchMixin): pass
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


class DistributionTaxonLatNorthNull(TaxonLatNorthNull, DistributionMixin): pass
class DistributionTaxonLatSouthNull(TaxonLatSouthNull, DistributionMixin): pass
class DistributionTaxonMinDepthNull(TaxonMinDepthNull, DistributionMixin): pass
class DistributionTaxonMaxDepthNull(TaxonMaxDepthNull, DistributionMixin): pass
class DistributionTaxonHabitatFaoNotOverlapExtent(TaxonHabitatFaoNotOverlapExtent, DistributionMixin): pass
class DistributionTaxonExtentAvailableButNoHabitat(TaxonExtentAvailableButNoHabitat, DistributionMixin): pass
