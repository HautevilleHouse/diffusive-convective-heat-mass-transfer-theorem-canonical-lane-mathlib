import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure DimensionlessNumbersPackage where
  reynoldsNumber : Prop
  prandtlNumber : Prop
  schmidtNumber : Prop
  pecletNumber : Prop
  grashofNumber : Prop
  rayleighNumber : Prop
  lewisNumber : Prop

structure DimensionlessNumbersEvidence (P : DimensionlessNumbersPackage) where
  reynoldsNumberClosed : P.reynoldsNumber
  prandtlNumberClosed : P.prandtlNumber
  schmidtNumberClosed : P.schmidtNumber
  pecletNumberClosed : P.pecletNumber
  grashofNumberClosed : P.grashofNumber
  rayleighNumberClosed : P.rayleighNumber
  lewisNumberClosed : P.lewisNumber

def DimensionlessNumbersClosed (P : DimensionlessNumbersPackage) : Prop :=
  P.reynoldsNumber ∧ P.prandtlNumber ∧ P.schmidtNumber ∧ P.pecletNumber ∧ P.grashofNumber ∧ P.rayleighNumber ∧ P.lewisNumber

theorem dimensionless_numbers_closed_from_evidence (P : DimensionlessNumbersPackage) (E : DimensionlessNumbersEvidence P) : DimensionlessNumbersClosed P := by
  exact And.intro E.reynoldsNumberClosed (And.intro E.prandtlNumberClosed (And.intro E.schmidtNumberClosed (And.intro E.pecletNumberClosed (And.intro E.grashofNumberClosed (And.intro E.rayleighNumberClosed E.lewisNumberClosed)))))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse
