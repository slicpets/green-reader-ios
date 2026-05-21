import SwiftUI
import RealityKit
import ARKit

struct ARGreenView: UIViewRepresentable {

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        arView.session.run(configuration)

        let tap = UITapGestureRecognizer(
            target: context.coordinator,
            action: #selector(Coordinator.handleTap(_:))
        )

        arView.addGestureRecognizer(tap)
        context.coordinator.arView = arView

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    class Coordinator: NSObject {
        weak var arView: ARView?

        var ballPosition: SIMD3<Float>?
        var holePosition: SIMD3<Float>?

        @objc func handleTap(_ gesture: UITapGestureRecognizer) {
            guard let arView = arView else { return }

            let location = gesture.location(in: arView)

            guard let result = arView.raycast(
                from: location,
                allowing: .estimatedPlane,
                alignment: .horizontal
            ).first else {
                return
            }

            let position = SIMD3<Float>(
                result.worldTransform.columns.3.x,
                result.worldTransform.columns.3.y,
                result.worldTransform.columns.3.z
            )

            if ballPosition == nil {
                ballPosition = position
                placeSphere(at: position, color: .white, radius: 0.035, in: arView)
                print("Ball placed")
            } else if holePosition == nil {
                holePosition = position
                placeSphere(at: position, color: .red, radius: 0.05, in: arView)
                calculateReading()
            }
        }

        func calculateReading() {
            guard let ball = ballPosition, let hole = holePosition else { return }

            let distance = GreenReadingModel.distanceFeet(from: ball, to: hole)
            let slope = GreenReadingModel.slopePercent(from: ball, to: hole)
            let breakEstimate = PuttPhysics.estimateBreakInches(
                distanceFeet: distance,
                slopePercent: slope,
                stimp: 10
            )

            print("Distance: \(distance) feet")
            print("Slope: \(slope)%")
            print("Estimated break: \(breakEstimate) inches")
        }

        func placeSphere(
            at position: SIMD3<Float>,
            color: UIColor,
            radius: Float,
            in arView: ARView
        ) {
            let mesh = MeshResource.generateSphere(radius: radius)
            let material = SimpleMaterial(color: color, isMetallic: false)
            let entity = ModelEntity(mesh: mesh, materials: [material])

            let anchor = AnchorEntity(world: position)
            anchor.addChild(entity)
            arView.scene.addAnchor(anchor)
        }
    }
}
