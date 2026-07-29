import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean.DiffusiveConvectivePDE

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure FiniteDifferenceDiscretizationPackage {P : DiffusiveConvectivePDEPackage} where
  spatialGrid : Prop
  timeStepping : Prop
  upwindScheme : Prop
  centralDifference : Prop
  stabilityCondition : Prop
  convergenceOrder : Prop

structure FiniteDifferenceDiscretizationEvidence {P : DiffusiveConvectivePDEPackage}
    (D : FiniteDifferenceDiscretizationPackage P) where
  spatialGridClosed : D.spatialGrid
  timeSteppingClosed : D.timeStepping
  upwindSchemeClosed : D.upwindScheme
  centralDifferenceClosed : D.centralDifference
  stabilityConditionClosed : D.stabilityCondition
  convergenceOrderClosed : D.convergenceOrder

def FiniteDifferenceDiscretizationClosed {P : DiffusiveConvectivePDEPackage}
    (D : FiniteDifferenceDiscretizationPackage P) : Prop :=
  D.spatialGrid ∧ D.timeStepping ∧ D.upwindScheme ∧ D.centralDifference ∧ D.stabilityCondition ∧ D.convergenceOrder

theorem finite_difference_discretization_closed_from_evidence {P : DiffusiveConvectivePDEPackage}
    (D : FiniteDifferenceDiscretizationPackage P) (E : FiniteDifferenceDiscretizationEvidence D) :
    FiniteDifferenceDiscretizationClosed D := by
  exact And.intro E.spatialGridClosed
    (And.intro E.timeSteppingClosed
      (And.intro E.upwindSchemeClosed
        (And.intro E.centralDifferenceClosed
          (And.intro E.stabilityConditionClosed E.convergenceOrderClosed))))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse