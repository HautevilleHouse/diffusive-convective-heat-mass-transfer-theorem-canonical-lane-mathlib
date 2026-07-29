import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiffusiveConvectiveHeatMassTransferTheorem.NusseltSherwoodClosure

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferTheorem

structure BoundaryLayerAnalogyPackage {P : DiffusiveConvectivePDEPackage} where
  prandtlNumber : Prop
  schmidtNumber : Prop
  reynoldsAnalogy : Prop
  chiltonColburnAnalogy : Prop
  universalVelocityProfile : Prop

structure BoundaryLayerAnalogyEvidence {P : DiffusiveConvectivePDEPackage} (B : BoundaryLayerAnalogyPackage P) where
  prandtlNumberClosed : B.prandtlNumber
  schmidtNumberClosed : B.schmidtNumber
  reynoldsAnalogyClosed : B.reynoldsAnalogy
  chiltonColburnAnalogyClosed : B.chiltonColburnAnalogy
  universalVelocityProfileClosed : B.universalVelocityProfile

def BoundaryLayerAnalogyClosed {P : DiffusiveConvectivePDEPackage} (B : BoundaryLayerAnalogyPackage P) : Prop :=
  B.prandtlNumber ∧ B.schmidtNumber ∧ B.reynoldsAnalogy ∧ B.chiltonColburnAnalogy ∧ B.universalVelocityProfile

theorem boundary_layer_analogy_closed_from_evidence
    {P : DiffusiveConvectivePDEPackage} (B : BoundaryLayerAnalogyPackage P) (E : BoundaryLayerAnalogyEvidence B) :
    BoundaryLayerAnalogyClosed B := by
  exact And.intro E.prandtlNumberClosed
    (And.intro E.schmidtNumberClosed
      (And.intro E.reynoldsAnalogyClosed
        (And.intro E.chiltonColburnAnalogyClosed E.universalVelocityProfileClosed)))

end DiffusiveConvectiveHeatMassTransferTheorem
end HautevilleHouse
