class RawCatchMixin: pass
class CatchMixin: pass
class ReconView: pass

class WarningView(ReconView):
    type = "warning"


class ErrorView(ReconView):
    type = "error"


class AmountGreaterThanThreshold(WarningView):
    message = "Amount > 5e6"
    view = "amount_greater_than_threshold"
    col = "amount"


class AmountZeroOrNegative(ErrorView):
    message = "Catch amount is zero or negative"
    view = "amount_zero_or_negative"
    col = "amount"


class FAO21NAFONull(WarningView):
    message = "Null NAFO for FAO 21"
    view = "fao_21_nafo_null"
    col = "nafo_division_id"


class FAO27ICESNull(WarningView):
    message = "Null ICES for FAO 27"
    view = "fao_27_ices_null"
    col = "ices_area_id"


class FishingEntityAndEEZNotAligned(ErrorView):
    message = "Layer is incorrect (determined by EEZ, Fishing Entity, and Taxon)"
    view = "fishing_entity_and_eez_not_aligned"
    col = "layer"


class InputNotReconstructedCatchTypeNotReported(ErrorView):
    message = "Input type is not reconstructed and Catch type not reported landings"
    view = "input_not_reconstructed_catch_type_not_reported"
    col = "input_type_id"


class InputReconstructedCatchTypeReported(ErrorView):
    message = "Input type is reconstructed and Catch type is reported landings"
    view = "input_reconstructed_catch_type_reported"
    col = "input_type_id"


class Layer2Or3AndSectorNotIndustrial(WarningView):
    message = "Layer is 2 or 3 and Sector is not industrial"
    view = "layer_2_or_3_and_sector_not_industrial"
    col = "layer"


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


class TaxaIsRare(ErrorView):
    message = "Rare taxa should be excluded"
    view = "taxa_is_rare"
    col = "taxon_key"


class YearMax(WarningView):
    message = "Year after 2010"
    view = "year_max"
    col = "year"


class RawCatchAmountGreaterThanThreshold(AmountGreaterThanThreshold, RawCatchMixin): pass
class RawCatchAmountZeroOrNegative(AmountZeroOrNegative, RawCatchMixin): pass
class RawCatchFAO21NAFONull(FAO21NAFONull, RawCatchMixin): pass
class RawCatchFAO27ICESNull(FAO27ICESNull, RawCatchMixin): pass
class RawCatchFishingEntityAndEEZNotAligned(FishingEntityAndEEZNotAligned, RawCatchMixin): pass
class RawCatchInputNotReconstructedCatchTypeNotReported(InputNotReconstructedCatchTypeNotReported, RawCatchMixin): pass
class RawCatchInputReconstructedCatchTypeReported(InputReconstructedCatchTypeReported, RawCatchMixin): pass
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
class CatchInputNotReconstructedCatchTypeNotReported(InputNotReconstructedCatchTypeNotReported, CatchMixin): pass
class CatchInputReconstructedCatchTypeReported(InputReconstructedCatchTypeReported, CatchMixin): pass
class CatchLayer2Or3AndSectorNotIndustrial(Layer2Or3AndSectorNotIndustrial, CatchMixin): pass
class CatchLayerNotInRange(LayerNotInRange, CatchMixin): pass
class CatchOriginalCountryFishingNotNull(OriginalCountryFishingNotNull, CatchMixin): pass
class CatchOriginalSectorNotNull(OriginalSectorNotNull, CatchMixin): pass
class CatchOriginalTaxonNotNull(OriginalTaxonNotNull, CatchMixin): pass
class CatchPeruCatchAmountGreaterThanThreshold(PeruCatchAmountGreaterThanThreshold, CatchMixin): pass
class CatchSubsistenceAndLayerNot1(SubsistenceAndLayerNot1, CatchMixin): pass
class CatchTaxaIsRare(TaxaIsRare, CatchMixin): pass
class CatchYearMax(YearMax, CatchMixin): pass
