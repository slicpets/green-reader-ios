import SwiftUI

struct ContentView: View {
    var body: some View {
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

                Button("Start Scan") {

                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
            }
        }
    }
}

#Preview {
    ContentView()
}
