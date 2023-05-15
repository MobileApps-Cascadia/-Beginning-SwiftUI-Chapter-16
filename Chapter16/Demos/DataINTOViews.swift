

import SwiftUI

struct DataINTOView: View {
    @State var usersText = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type something here:", text: $usersText)
                NavigationLink(destination: ViewThatReceivesData(message: usersText)) {
                    Text("Show me what I typed")
                }
                .padding()
                .font(.headline)
                .foregroundColor(.blue)
                
                .navigationTitle("Navigation Title")
            }.padding()
        }
    }
}

struct ViewThatReceivesData: View {
    var message: String
    
    var body: some View {
        VStack {
            Text("Message to display:")
            Text(message)
        }
        .padding()
        .background(Color.green)
    }
}


struct DataINTOView_Previews: PreviewProvider {
    static var previews: some View {
        DataINTOView()
    }
}
