import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure ConvectiveMassTransferPackage where
  ficksLaw : Prop
  convectiveDiffusionEquation : Prop
  massTransferCoefficient : Prop
  concentrationProfile : Prop
  boundaryCondition : Prop

structure ConvectiveMassTransferEvidence (P : ConvectiveMassTransferPackage) where
  ficksLawClosed : P.ficksLaw
  convectiveDiffusionEquationClosed : P.convectiveDiffusionEquation
  massTransferCoefficientClosed : P.massTransferCoefficient
  concentrationProfileClosed : P.concentrationProfile
  boundaryConditionClosed : P.boundaryCondition

def ConvectiveMassTransferClosed (P : ConvectiveMassTransferPackage) : Prop :=
  P.ficksLaw ∧ P.convectiveDiffusionEquation ∧ P.massTransferCoefficient ∧ P.concentrationProfile ∧ P.boundaryCondition

theorem convective_mass_transfer_closed_from_evidence (P : ConvectiveMassTransferPackage) (E : ConvectiveMassTransferEvidence P) : ConvectiveMassTransferClosed P := by
  exact And.intro E.ficksLawClosed (And.intro E.convectiveDiffusionEquationClosed (And.intro E.massTransferCoefficientClosed (And.intro E.concentrationProfileClosed E.boundaryConditionClosed)))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse
