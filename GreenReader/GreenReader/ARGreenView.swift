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
        var tapCount = 0

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

            tapCount += 1

            let color: UIColor = tapCount == 1 ? .white : .red
            let radius: Float = tapCount == 1 ? 0.035 : 0.05

            placeSphere(at: position, color: color, radius: radius, in: arView)
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
