import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiffusiveConvectiveHeatMassTransferTheorem.TransportPDE

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheorem

structure NusseltSherwoodPackage {P : DiffusiveConvectivePDEPackage} where
  nusseltNumber : Prop
  sherwoodNumber : Prop
  heatTransferCoefficient : Prop
  massTransferCoefficient : Prop
  correlationClosedForm : Prop

structure NusseltSherwoodEvidence {P : DiffusiveConvectivePDEPackage} (NS : NusseltSherwoodPackage P) where
  nusseltNumberClosed : NS.nusseltNumber
  sherwoodNumberClosed : NS.sherwoodNumber
  heatTransferCoefficientClosed : NS.heatTransferCoefficient
  massTransferCoefficientClosed : NS.massTransferCoefficient
  correlationClosedFormClosed : NS.correlationClosedForm

def NusseltSherwoodClosed {P : DiffusiveConvectivePDEPackage} (NS : NusseltSherwoodPackage P) : Prop :=
  NS.nusseltNumber ∧ NS.sherwoodNumber ∧ NS.heatTransferCoefficient ∧ NS.massTransferCoefficient ∧ NS.correlationClosedForm

theorem nusselt_sherwood_closed_from_evidence
    {P : DiffusiveConvectivePDEPackage} (NS : NusseltSherwoodPackage P) (E : NusseltSherwoodEvidence NS) :
    NusseltSherwoodClosed NS := by
  exact And.intro E.nusseltNumberClosed
    (And.intro E.sherwoodNumberClosed
      (And.intro E.heatTransferCoefficientClosed
        (And.intro E.massTransferCoefficientClosed E.correlationClosedFormClosed)))

end DiffusiveConvectiveHeatMassTransferTheorem
end HautevilleHouse
