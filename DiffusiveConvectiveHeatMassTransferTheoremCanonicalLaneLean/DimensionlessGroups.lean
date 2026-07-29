import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure DimensionlessGroupsPackage where
  reynoldsNumber : Prop
  prandtlNumber : Prop
  schmidtNumber : Prop
  pecletNumber : Prop
  nusseltNumber : Prop
  sherwoodNumber : Prop

structure DimensionlessGroupsEvidence (D : DimensionlessGroupsPackage) where
  reynoldsNumberClosed : D.reynoldsNumber
  prandtlNumberClosed : D.prandtlNumber
  schmidtNumberClosed : D.schmidtNumber
  pecletNumberClosed : D.pecletNumber
  nusseltNumberClosed : D.nusseltNumber
  sherwoodNumberClosed : D.sherwoodNumber

def DimensionlessGroupsClosed (D : DimensionlessGroupsPackage) : Prop :=
  D.reynoldsNumber ∧ D.prandtlNumber ∧ D.schmidtNumber ∧
  D.pecletNumber ∧ D.nusseltNumber ∧ D.sherwoodNumber

theorem dimensionless_groups_closed_from_evidence (D : DimensionlessGroupsPackage)
    (E : DimensionlessGroupsEvidence D) : DimensionlessGroupsClosed D := by
  exact And.intro E.reynoldsNumberClosed
    (And.intro E.prandtlNumberClosed
      (And.intro E.schmidtNumberClosed
        (And.intro E.pecletNumberClosed
          (And.intro E.nusseltNumberClosed E.sherwoodNumberClosed))))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse