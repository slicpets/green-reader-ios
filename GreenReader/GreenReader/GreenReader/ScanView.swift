import SwiftUI

struct ScanView: View {
    @State private var result: ReadingResult?

    var body: some View {
        ZStack {
            ARGreenView(result: $result)
                .ignoresSafeArea()

            VStack {
                Text("Tap ball, then tap hole")
                    .font(.title3)
                    .bold()
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)

                Spacer()

                if let result = result {
                    VStack(spacing: 8) {
                        Text("Distance: \(result.distanceFeet, specifier: "%.1f") ft")
                        Text("Slope: \(result.slopePercent, specifier: "%.2f")%")
                        Text("Break: \(result.breakInches, specifier: "%.1f") in")
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ScanView()
}
