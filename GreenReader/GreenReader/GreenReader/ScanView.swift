import SwiftUI

struct ScanView: View {

    @State private var result: ReadingResult?
    @State private var resetID = UUID()
    @State private var stimp: Float = 10

    var body: some View {

        ZStack {

            ARGreenView(
                result: $result,
                stimp: stimp
            )
            .id(resetID)
            .ignoresSafeArea()

            VStack {

                StimpSettings(stimp: $stimp)

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
