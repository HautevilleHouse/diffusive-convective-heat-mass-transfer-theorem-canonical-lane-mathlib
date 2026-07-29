import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure ExistenceAndUniquenessPackage where
  weakSolutionExists : Prop
  strongSolutionUnderRegularity : Prop
  uniquenessUnderBoundary : Prop
  continuousDependence : Prop
  maximalTimeInterval : Prop

structure ExistenceAndUniquenessEvidence (P : ExistenceAndUniquenessPackage) where
  weakSolutionExistsClosed : P.weakSolutionExists
  strongSolutionUnderRegularityClosed : P.strongSolutionUnderRegularity
  uniquenessUnderBoundaryClosed : P.uniquenessUnderBoundary
  continuousDependenceClosed : P.continuousDependence
  maximalTimeIntervalClosed : P.maximalTimeInterval

def ExistenceAndUniquenessClosed (P : ExistenceAndUniquenessPackage) : Prop :=
  P.weakSolutionExists ∧ P.strongSolutionUnderRegularity ∧
  P.uniquenessUnderBoundary ∧ P.continuousDependence ∧ P.maximalTimeInterval

theorem existence_and_uniqueness_closed_from_evidence
    (P : ExistenceAndUniquenessPackage) (E : ExistenceAndUniquenessEvidence P) :
    ExistenceAndUniquenessClosed P := by
  exact And.intro E.weakSolutionExistsClosed
    (And.intro E.strongSolutionUnderRegularityClosed
      (And.intro E.uniquenessUnderBoundaryClosed
        (And.intro E.continuousDependenceClosed E.maximalTimeIntervalClosed)))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse
