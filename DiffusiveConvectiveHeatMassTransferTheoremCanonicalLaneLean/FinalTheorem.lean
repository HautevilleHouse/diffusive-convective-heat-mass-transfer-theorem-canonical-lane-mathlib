import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiffusiveConvectiveHeatMassTransferTheorem.TransportPDE
import HautevilleHouse.DiffusiveConvectiveHeatMassTransferTheorem.NusseltSherwoodClosure
import HautevilleHouse.DiffusiveConvectiveHeatMassTransferTheorem.BoundaryLayerAnalogy

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheorem

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DiffusiveConvectivePDEClosed A.object.transportPDE

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.transportPDEConclusion

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedHeatMassClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_heat_mass_endgame (A : AdmissibleClass) :
    ConstrainedHeatMassClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiffusiveConvectiveHeatMassTransferTheorem
end HautevilleHouse
