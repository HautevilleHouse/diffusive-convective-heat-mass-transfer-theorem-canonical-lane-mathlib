import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean

structure DiffusiveConvectionPDEPackage where
  speciesConcentration : Type u
  temperatureField : Type v
  velocityField : Type w
  diffusionCoefficient : Type x
  thermalDiffusivity : Type y
  convectionTerm : Type z
  continuityEquation : Prop
  momentumEquation : Prop
  energyEquation : Prop
  speciesTransportEquation : Prop
  boundaryConditions : Prop

structure DiffusiveConvectionPDEEvidence (D : DiffusiveConvectionPDEPackage) where
  continuityEquationClosed : D.continuityEquation
  momentumEquationClosed : D.momentumEquation
  energyEquationClosed : D.energyEquation
  speciesTransportEquationClosed : D.speciesTransportEquation
  boundaryConditionsClosed : D.boundaryConditions

def DiffusiveConvectionPDEClosed (D : DiffusiveConvectionPDEPackage) : Prop :=
  D.continuityEquation ∧ D.momentumEquation ∧ D.energyEquation ∧ D.speciesTransportEquation ∧ D.boundaryConditions

theorem diffusive_convection_pde_closed_from_evidence (D : DiffusiveConvectionPDEPackage)
    (E : DiffusiveConvectionPDEEvidence D) : DiffusiveConvectionPDEClosed D := by
  exact And.intro E.continuityEquationClosed
    (And.intro E.momentumEquationClosed
      (And.intro E.energyEquationClosed
        (And.intro E.speciesTransportEquationClosed E.boundaryConditionsClosed)))

end DiffusiveConvectiveHeatMassTransferTheoremCanonicalLaneLean
end HautevilleHouse