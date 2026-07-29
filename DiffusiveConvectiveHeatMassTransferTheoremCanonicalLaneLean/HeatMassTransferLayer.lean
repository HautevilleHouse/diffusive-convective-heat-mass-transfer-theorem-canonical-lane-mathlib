import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure HeatMassTransferLayerPackage where
  nusseltNumber : Type u
  sherwoodNumber : Type v
  reynoldsNumber : Type w
  schmidtNumber : Type x
  prandtlNumber : Type y
  heatTransferCoefficient : Type z
  massTransferCoefficient : Type z
  nusseltCorrelation : Prop
  sherwoodCorrelation : Prop
  reynoldsNumberRange : Prop
  schmidtNumberRange : Prop
  prandtlNumberRange : Prop

structure HeatMassTransferLayerEvidence (H : HeatMassTransferLayerPackage) where
  nusseltCorrelationClosed : H.nusseltCorrelation
  sherwoodCorrelationClosed : H.sherwoodCorrelation
  reynoldsNumberRangeClosed : H.reynoldsNumberRange
  schmidtNumberRangeClosed : H.schmidtNumberRange
  prandtlNumberRangeClosed : H.prandtlNumberRange

def HeatMassTransferLayerClosed (H : HeatMassTransferLayerPackage) : Prop :=
  H.nusseltCorrelation ∧ H.sherwoodCorrelation ∧ H.reynoldsNumberRange ∧ H.schmidtNumberRange ∧ H.prandtlNumberRange

theorem heat_mass_transfer_layer_closed_from_evidence (H : HeatMassTransferLayerPackage)
    (E : HeatMassTransferLayerEvidence H) : HeatMassTransferLayerClosed H := by
  exact And.intro E.nusseltCorrelationClosed
    (And.intro E.sherwoodCorrelationClosed
      (And.intro E.reynoldsNumberRangeClosed
        (And.intro E.schmidtNumberRangeClosed E.prandtlNumberRangeClosed)))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse