import SwiftUI

struct StimpSettings: View {
    @Binding var stimp: Float

    var body: some View {
        VStack {
            Text("Green Speed: \(stimp, specifier: "%.0f")")

            Slider(
                value: $stimp,
                in: 6...14,
                step: 1
            )
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(12)
    }
}
