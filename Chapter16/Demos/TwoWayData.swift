import SwiftUI

struct TwoWayDataView: View {
    @State var usersText = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type something here:", text: $usersText)
                NavigationLink(destination: ViewThatReceivesAndModifiesData(message: $usersText)) {
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

struct ViewThatReceivesAndModifiesData: View {
    @Binding var message: String
    
    var body: some View {
        VStack {
            Text("Message to display:")
            Text("(Change the message by editing this:)")
            TextField("Change the message by editing this", text: $message)
        }
        .padding()
        .background(Color.green)
    }
}


struct TwoWayDataView_Previews: PreviewProvider {
    static var previews: some View {
        TwoWayDataView()
    }
}
