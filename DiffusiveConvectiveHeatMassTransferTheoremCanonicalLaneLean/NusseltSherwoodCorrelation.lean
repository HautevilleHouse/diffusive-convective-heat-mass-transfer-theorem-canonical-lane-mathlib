import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean.DiffusiveConvectivePDE

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure NusseltSherwoodCorrelationPackage {P : DiffusiveConvectivePDEPackage} where
  nusseltNumber : Prop
  sherwoodNumber : Prop
  reynoldsNumber : Prop
  schmidtNumber : Prop
  prandtlNumber : Prop
  correlationHeat : Prop
  correlationMass : Prop

structure NusseltSherwoodCorrelationEvidence {P : DiffusiveConvectivePDEPackage}
    (C : NusseltSherwoodCorrelationPackage P) where
  nusseltNumberClosed : C.nusseltNumber
  sherwoodNumberClosed : C.sherwoodNumber
  reynoldsNumberClosed : C.reynoldsNumber
  schmidtNumberClosed : C.schmidtNumber
  prandtlNumberClosed : C.prandtlNumber
  correlationHeatClosed : C.correlationHeat
  correlationMassClosed : C.correlationMass

def NusseltSherwoodCorrelationClosed {P : DiffusiveConvectivePDEPackage}
    (C : NusseltSherwoodCorrelationPackage P) : Prop :=
  C.nusseltNumber ∧ C.sherwoodNumber ∧ C.reynoldsNumber ∧ C.schmidtNumber ∧ C.prandtlNumber ∧
  C.correlationHeat ∧ C.correlationMass

theorem nusselt_sherwood_correlation_closed_from_evidence {P : DiffusiveConvectivePDEPackage}
    (C : NusseltSherwoodCorrelationPackage P) (E : NusseltSherwoodCorrelationEvidence C) :
    NusseltSherwoodCorrelationClosed C := by
  exact And.intro E.nusseltNumberClosed
    (And.intro E.sherwoodNumberClosed
      (And.intro E.reynoldsNumberClosed
        (And.intro E.schmidtNumberClosed
          (And.intro E.prandtlNumberClosed
            (And.intro E.correlationHeatClosed E.correlationMassClosed)))))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse