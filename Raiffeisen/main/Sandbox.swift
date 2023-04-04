import SwiftUI

struct Sandbox: View {
    var body: some View {

        Label {
            Text("цифровая, *5191")
        } icon: {
            Image("cloudIcon")
        }
    }
}

struct Sandbox_Previews: PreviewProvider {
    static var previews: some View {
        Sandbox()
    }
}
