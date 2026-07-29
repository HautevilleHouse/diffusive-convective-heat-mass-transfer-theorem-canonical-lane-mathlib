import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure DiffusiveConvectivePDEPackage where
  domain : Type u
  domainTopology : TopologicalSpace domain
  heatEquation : domain → Prop
  massDiffusionEquation : domain → Prop
  convectionTerm : domain → Prop
  couplingCondition : domain → Prop
  initialBoundary : domain → Prop

structure DiffusiveConvectivePDEEvidence (P : DiffusiveConvectivePDEPackage) where
  heatEquationClosed : ∀ x, P.heatEquation x
  massDiffusionEquationClosed : ∀ x, P.massDiffusionEquation x
  convectionTermClosed : ∀ x, P.convectionTerm x
  couplingConditionClosed : ∀ x, P.couplingCondition x
  initialBoundaryClosed : ∀ x, P.initialBoundary x

def DiffusiveConvectivePDEClosed (P : DiffusiveConvectivePDEPackage) : Prop :=
  (∀ x, P.heatEquation x) ∧ (∀ x, P.massDiffusionEquation x) ∧ (∀ x, P.convectionTerm x) ∧
  (∀ x, P.couplingCondition x) ∧ (∀ x, P.initialBoundary x)

theorem diffusive_convective_pde_closed_from_evidence (P : DiffusiveConvectivePDEPackage)
    (E : DiffusiveConvectivePDEEvidence P) : DiffusiveConvectivePDEClosed P := by
  exact And.intro E.heatEquationClosed
    (And.intro E.massDiffusionEquationClosed
      (And.intro E.convectionTermClosed
        (And.intro E.couplingConditionClosed E.initialBoundaryClosed)))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse