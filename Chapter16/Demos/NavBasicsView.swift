
import SwiftUI

struct NavBasicsView: View {
    @State var flag = true
    var body: some View {
        NavigationView {
            Toggle(isOn: $flag, label: {
                Text("Toggle display mode")
            })
            .navigationTitle("Navigation Title")
            .navigationBarTitleDisplayMode(flag ? .large : .inline)
        }.padding()
    }
    
}

struct NavBasicsView_Previews: PreviewProvider {
    static var previews: some View {
        NavBasicsView()
    }
}
