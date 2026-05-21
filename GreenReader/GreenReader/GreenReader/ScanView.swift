import SwiftUI

struct ScanView: View {
    @State private var result: ReadingResult?
    @State private var resetID = UUID()

    var body: some View {
        ZStack {
            ARGreenView(result: $result)
                .id(resetID)
                .ignoresSafeArea()

            VStack {
                Spacer()

                ScanControls(result: result) {
                    result = nil
                    resetID = UUID()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ScanView()
}
