import SwiftUI

struct ScanView: View {
    var body: some View {
        ZStack {
            ARGreenView()
                .ignoresSafeArea()

            VStack {
                Text("Scan the green")
                    .font(.title)
                    .bold()
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ScanView()
}
