import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure CoupledHeatMassTransferPackage where
  soretEffect : Prop
  dufourEffect : Prop
  thermalDiffusion : Prop
  diffusionThermo : Prop
  couplingEquations : Prop

structure CoupledHeatMassTransferEvidence (P : CoupledHeatMassTransferPackage) where
  soretEffectClosed : P.soretEffect
  dufourEffectClosed : P.dufourEffect
  thermalDiffusionClosed : P.thermalDiffusion
  diffusionThermoClosed : P.diffusionThermo
  couplingEquationsClosed : P.couplingEquations

def CoupledHeatMassTransferClosed (P : CoupledHeatMassTransferPackage) : Prop :=
  P.soretEffect ∧ P.dufourEffect ∧ P.thermalDiffusion ∧ P.diffusionThermo ∧ P.couplingEquations

theorem coupled_heat_mass_transfer_closed_from_evidence (P : CoupledHeatMassTransferPackage) (E : CoupledHeatMassTransferEvidence P) : CoupledHeatMassTransferClosed P := by
  exact And.intro E.soretEffectClosed (And.intro E.dufourEffectClosed (And.intro E.thermalDiffusionClosed (And.intro E.diffusionThermoClosed E.couplingEquationsClosed)))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse
