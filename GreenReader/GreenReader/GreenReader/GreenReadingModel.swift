import Foundation
import simd

struct GreenReadingModel {

    static func distanceFeet(
        from ball: SIMD3<Float>,
        to hole: SIMD3<Float>
    ) -> Float {

        let meters = simd_distance(ball, hole)
        return meters * 3.28084
    }

    static func slopePercent(
        from ball: SIMD3<Float>,
        to hole: SIMD3<Float>
    ) -> Float {

        let rise = hole.y - ball.y

        let run = simd_distance(
            SIMD2<Float>(ball.x, ball.z),
            SIMD2<Float>(hole.x, hole.z)
        )

        if run == 0 {
            return 0
        }

        return (rise / run) * 100
    }
}
