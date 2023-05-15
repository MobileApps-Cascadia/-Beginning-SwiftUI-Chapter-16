import SwiftUI

struct NavWithButtonsView: View {
    @State var message = "Starting message"
    @State var flag = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text(message)
                Toggle(isOn: $flag, label: {
                    Text("Toggle display mode")
                })
                .navigationTitle("Navigation Title")
                .navigationBarTitleDisplayMode(flag ? .large : .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            message = "iCloud icon tapped"
                        } label: {
                            Image(systemName: "icloud")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            message = "Done button tapped"
                        } label: {
                            Text("Done")
                        }
                    }
                }
            }
        }.accentColor(.purple)
    }
}

struct NavWithButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        NavWithButtonsView()
    }
}



