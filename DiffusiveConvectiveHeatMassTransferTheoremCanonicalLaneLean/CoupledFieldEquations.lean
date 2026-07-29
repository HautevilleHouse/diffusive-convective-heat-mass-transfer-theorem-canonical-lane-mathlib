import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure CoupledFieldEquationsPackage where
  massConservationCoupled : Prop
  energyConservationCoupled : Prop
  couplingTerms : Prop
  solvabilityConditions : Prop
  uniquenessConditions : Prop

structure CoupledFieldEquationsEvidence (P : CoupledFieldEquationsPackage) where
  massConservationCoupledClosed : P.massConservationCoupled
  energyConservationCoupledClosed : P.energyConservationCoupled
  couplingTermsClosed : P.couplingTerms
  solvabilityConditionsClosed : P.solvabilityConditions
  uniquenessConditionsClosed : P.uniquenessConditions

def CoupledFieldEquationsClosed (P : CoupledFieldEquationsPackage) : Prop :=
  P.massConservationCoupled ∧ P.energyConservationCoupled ∧
  P.couplingTerms ∧ P.solvabilityConditions ∧ P.uniquenessConditions

theorem coupled_field_equations_closed_from_evidence
    (P : CoupledFieldEquationsPackage) (E : CoupledFieldEquationsEvidence P) :
    CoupledFieldEquationsClosed P := by
  exact And.intro E.massConservationCoupledClosed
    (And.intro E.energyConservationCoupledClosed
      (And.intro E.couplingTermsClosed
        (And.intro E.solvabilityConditionsClosed E.uniquenessConditionsClosed)))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse
