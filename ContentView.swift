import SwiftUI

struct ContentView: View {

    var body: some View {
        Color.gray
            .reverseMask {
                Rectangle()
                    .frame(width: 50, height: 40)
            }
    }
}

extension View {
    
    @ViewBuilder func reverseMask<Mask: View>(
        alignment: Alignment = .center,
        @ViewBuilder _ mask: () -> Mask
    ) -> some View {
        self.mask {
            Rectangle()
                .overlay(alignment: alignment) {
                    mask()
                        .blendMode(.destinationOut)
                }
        }
    }
}
