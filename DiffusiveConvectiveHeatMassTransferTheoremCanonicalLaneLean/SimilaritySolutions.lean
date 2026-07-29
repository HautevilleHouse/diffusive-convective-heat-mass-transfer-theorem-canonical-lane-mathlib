import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure SimilaritySolutionsPackage where
  similarityVariable : Prop
  ordinaryDifferentialEquations : Prop
  boundaryLayerProfiles : Prop
  heatAndMassTransferCoefficients : Prop

structure SimilaritySolutionsEvidence (S : SimilaritySolutionsPackage) where
  similarityVariableClosed : S.similarityVariable
  ordinaryDifferentialEquationsClosed : S.ordinaryDifferentialEquations
  boundaryLayerProfilesClosed : S.boundaryLayerProfiles
  heatAndMassTransferCoefficientsClosed : S.heatAndMassTransferCoefficients

def SimilaritySolutionsClosed (S : SimilaritySolutionsPackage) : Prop :=
  S.similarityVariable ∧ S.ordinaryDifferentialEquations ∧
  S.boundaryLayerProfiles ∧ S.heatAndMassTransferCoefficients

theorem similarity_solutions_closed_from_evidence (S : SimilaritySolutionsPackage)
    (E : SimilaritySolutionsEvidence S) : SimilaritySolutionsClosed S := by
  exact And.intro E.similarityVariableClosed
    (And.intro E.ordinaryDifferentialEquationsClosed
      (And.intro E.boundaryLayerProfilesClosed E.heatAndMassTransferCoefficientsClosed))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse