import SwiftUI

struct ScanControls: View {
    let result: ReadingResult?
    let resetAction: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            Text("Tap ball, then tap hole")
                .font(.headline)

            if let result = result {
                VStack(spacing: 6) {
                    Text("Distance: \(result.distanceFeet, specifier: "%.1f") ft")
                    Text("Slope: \(result.slopePercent, specifier: "%.2f")%")
                    Text("Break: \(result.breakInches, specifier: "%.1f") in")
                }

                Button("Reset Scan") {
                    resetAction()
                }
                .padding(.top, 8)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(12)
    }
}
