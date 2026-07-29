import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure SpeciesConservationPackage where
  speciesDiffusionCoefficient : Prop
  speciesConvectionVelocity : Prop
  speciesSourceTerm : Prop
  conservationEquationFormulated : Prop
  boundaryConditions : Prop

structure SpeciesConservationEvidence (P : SpeciesConservationPackage) where
  speciesDiffusionCoefficientClosed : P.speciesDiffusionCoefficient
  speciesConvectionVelocityClosed : P.speciesConvectionVelocity
  speciesSourceTermClosed : P.speciesSourceTerm
  conservationEquationFormulatedClosed : P.conservationEquationFormulated
  boundaryConditionsClosed : P.boundaryConditions

def SpeciesConservationClosed (P : SpeciesConservationPackage) : Prop :=
  P.speciesDiffusionCoefficient ∧ P.speciesConvectionVelocity ∧
  P.speciesSourceTerm ∧ P.conservationEquationFormulated ∧ P.boundaryConditions

theorem species_conservation_closed_from_evidence
    (P : SpeciesConservationPackage) (E : SpeciesConservationEvidence P) :
    SpeciesConservationClosed P := by
  exact And.intro E.speciesDiffusionCoefficientClosed
    (And.intro E.speciesConvectionVelocityClosed
      (And.intro E.speciesSourceTermClosed
        (And.intro E.conservationEquationFormulatedClosed E.boundaryConditionsClosed)))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse
