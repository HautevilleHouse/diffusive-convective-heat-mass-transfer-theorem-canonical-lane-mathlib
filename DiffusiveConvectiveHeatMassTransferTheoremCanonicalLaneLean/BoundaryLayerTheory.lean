import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure BoundaryLayerTheoryPackage where
  velocityBoundaryLayerThickness : Type u
  thermalBoundaryLayerThickness : Type v
  concentrationBoundaryLayerThickness : Type w
  blasiusSolution : Prop
  energyIntegralMethod : Prop
  speciesIntegralMethod : Prop
  similaritySolution : Prop
  prandtlNumberEffect : Prop
  schmidtNumberEffect : Prop

structure BoundaryLayerTheoryEvidence (B : BoundaryLayerTheoryPackage) where
  blasiusSolutionClosed : B.blasiusSolution
  energyIntegralMethodClosed : B.energyIntegralMethod
  speciesIntegralMethodClosed : B.speciesIntegralMethod
  similaritySolutionClosed : B.similaritySolution
  prandtlNumberEffectClosed : B.prandtlNumberEffect
  schmidtNumberEffectClosed : B.schmidtNumberEffect

def BoundaryLayerTheoryClosed (B : BoundaryLayerTheoryPackage) : Prop :=
  B.blasiusSolution ∧ B.energyIntegralMethod ∧ B.speciesIntegralMethod ∧
  B.similaritySolution ∧ B.prandtlNumberEffect ∧ B.schmidtNumberEffect

theorem boundary_layer_theory_closed_from_evidence (B : BoundaryLayerTheoryPackage)
    (E : BoundaryLayerTheoryEvidence B) : BoundaryLayerTheoryClosed B := by
  exact And.intro E.blasiusSolutionClosed
    (And.intro E.energyIntegralMethodClosed
      (And.intro E.speciesIntegralMethodClosed
        (And.intro E.similaritySolutionClosed
          (And.intro E.prandtlNumberEffectClosed E.schmidtNumberEffectClosed))))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse