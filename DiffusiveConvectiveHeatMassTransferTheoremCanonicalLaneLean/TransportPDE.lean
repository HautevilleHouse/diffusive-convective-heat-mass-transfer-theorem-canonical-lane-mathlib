import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheorem

structure DiffusiveConvectivePDEPackage where
  spatialDomain : Type u
  timeDomain : Type v
  temperatureField : Type w
  concentrationField : Type x
  diffusivityTensor : Type y
  convectiveVelocity : Type z
  heatEquation : Prop
  massEquation : Prop
  wellPosedInitialBoundary : Prop
  couplingTerm : Prop

structure DiffusiveConvectivePDEEvidence (P : DiffusiveConvectivePDEPackage) where
  heatEquationClosed : P.heatEquation
  massEquationClosed : P.massEquation
  wellPosedInitialBoundaryClosed : P.wellPosedInitialBoundary
  couplingTermClosed : P.couplingTerm

def DiffusiveConvectivePDEClosed (P : DiffusiveConvectivePDEPackage) : Prop :=
  P.heatEquation ∧ P.massEquation ∧ P.wellPosedInitialBoundary ∧ P.couplingTerm

theorem diffusive_convective_pde_closed_from_evidence
    (P : DiffusiveConvectivePDEPackage) (E : DiffusiveConvectivePDEEvidence P) :
    DiffusiveConvectivePDEClosed P := by
  exact And.intro E.heatEquationClosed
    (And.intro E.massEquationClosed
      (And.intro E.wellPosedInitialBoundaryClosed E.couplingTermClosed))

end DiffusiveConvectiveHeatMassTransferTheorem
end HautevilleHouse
