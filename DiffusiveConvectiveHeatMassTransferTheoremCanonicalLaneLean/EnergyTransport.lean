import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure EnergyTransportPackage where
  thermalDiffusivity : Prop
  convectiveHeatFlux : Prop
  heatSourceTerm : Prop
  energyEquationFormulated : Prop
  radiationEffects : Prop

structure EnergyTransportEvidence (P : EnergyTransportPackage) where
  thermalDiffusivityClosed : P.thermalDiffusivity
  convectiveHeatFluxClosed : P.convectiveHeatFlux
  heatSourceTermClosed : P.heatSourceTerm
  energyEquationFormulatedClosed : P.energyEquationFormulated
  radiationEffectsClosed : P.radiationEffects

def EnergyTransportClosed (P : EnergyTransportPackage) : Prop :=
  P.thermalDiffusivity ∧ P.convectiveHeatFlux ∧
  P.heatSourceTerm ∧ P.energyEquationFormulated ∧ P.radiationEffects

theorem energy_transport_closed_from_evidence
    (P : EnergyTransportPackage) (E : EnergyTransportEvidence P) :
    EnergyTransportClosed P := by
  exact And.intro E.thermalDiffusivityClosed
    (And.intro E.convectiveHeatFluxClosed
      (And.intro E.heatSourceTermClosed
        (And.intro E.energyEquationFormulatedClosed E.radiationEffectsClosed)))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse
