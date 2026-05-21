import Foundation

struct PuttPhysics {

    static func estimateBreakInches(
        distanceFeet: Float,
        slopePercent: Float,
        stimp: Float
    ) -> Float {

        let slopeFactor = slopePercent / 2.0
        let speedFactor = 10.0 / stimp
        let distanceFactor = distanceFeet * distanceFeet / 100.0

        return slopeFactor * speedFactor * distanceFactor * 12.0
    }
}
