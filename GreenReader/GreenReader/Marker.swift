import Foundation
import simd

struct Marker {

    let position: SIMD3<Float>
    let type: MarkerType
}

enum MarkerType {
    case ball
    case hole
}
