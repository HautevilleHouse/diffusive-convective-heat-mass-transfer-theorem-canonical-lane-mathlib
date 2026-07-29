import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure BoundaryLayerPackage where
  velocityBoundaryLayer : Prop
  thermalBoundaryLayer : Prop
  concentrationBoundaryLayer : Prop
  similaritySolution : Prop
  nusseltNumber : Prop
  sherwoodNumber : Prop

structure BoundaryLayerEvidence (P : BoundaryLayerPackage) where
  velocityBoundaryLayerClosed : P.velocityBoundaryLayer
  thermalBoundaryLayerClosed : P.thermalBoundaryLayer
  concentrationBoundaryLayerClosed : P.concentrationBoundaryLayer
  similaritySolutionClosed : P.similaritySolution
  nusseltNumberClosed : P.nusseltNumber
  sherwoodNumberClosed : P.sherwoodNumber

def BoundaryLayerClosed (P : BoundaryLayerPackage) : Prop :=
  P.velocityBoundaryLayer ∧ P.thermalBoundaryLayer ∧ P.concentrationBoundaryLayer ∧ P.similaritySolution ∧ P.nusseltNumber ∧ P.sherwoodNumber

theorem boundary_layer_closed_from_evidence (P : BoundaryLayerPackage) (E : BoundaryLayerEvidence P) : BoundaryLayerClosed P := by
  exact And.intro E.velocityBoundaryLayerClosed (And.intro E.thermalBoundaryLayerClosed (And.intro E.concentrationBoundaryLayerClosed (And.intro E.similaritySolutionClosed (And.intro E.nusseltNumberClosed E.sherwoodNumberClosed))))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse
