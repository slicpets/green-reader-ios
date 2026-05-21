import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.green
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Green Reader")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)

                    Text("AR Golf Green Scanner")
                        .font(.headline)
                        .foregroundColor(.white)

                    NavigationLink("Start Scan") {
                        ScanView()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
