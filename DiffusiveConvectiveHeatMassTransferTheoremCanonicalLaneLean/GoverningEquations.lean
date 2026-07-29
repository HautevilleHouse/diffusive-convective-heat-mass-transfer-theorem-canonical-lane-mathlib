import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure GoverningEquationsPackage where
  conservationOfMass : Prop
  conservationOfMomentum : Prop
  energyEquation : Prop
  speciesTransport : Prop
  constitutiveRelations : Prop

structure GoverningEquationsEvidence (P : GoverningEquationsPackage) where
  conservationOfMassClosed : P.conservationOfMass
  conservationOfMomentumClosed : P.conservationOfMomentum
  energyEquationClosed : P.energyEquation
  speciesTransportClosed : P.speciesTransport
  constitutiveRelationsClosed : P.constitutiveRelations

def GoverningEquationsClosed (P : GoverningEquationsPackage) : Prop :=
  P.conservationOfMass ∧ P.conservationOfMomentum ∧ P.energyEquation ∧ P.speciesTransport ∧ P.constitutiveRelations

theorem governing_equations_closed_from_evidence (P : GoverningEquationsPackage) (E : GoverningEquationsEvidence P) : GoverningEquationsClosed P := by
  exact And.intro E.conservationOfMassClosed (And.intro E.conservationOfMomentumClosed (And.intro E.energyEquationClosed (And.intro E.speciesTransportClosed E.constitutiveRelationsClosed)))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse
