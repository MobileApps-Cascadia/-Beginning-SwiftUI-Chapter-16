
import SwiftUI

class AppData : ObservableObject {
    @Published var userName = ""
}

struct MultiLevelSharingView: View {
    @StateObject var theData = AppData()
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Type something to change, here:")
                TextField("Type something here:", text: $theData.userName)
                Spacer()
                
                FirstLevelOfChildren()
                Spacer()
                NavigationLink(destination: FirstLevelOfLinkedChildren()) {
                    Text("Go to the first level of linked children")
                }
                .padding()
                .font(.headline)
                .foregroundColor(.blue)
                
                .navigationTitle("Navigation Title")
            }.padding()
        }.environmentObject( theData )
    }
}

struct ThirdLevelOfChildren: View {
    @EnvironmentObject var appWideData: AppData
    var body: some View {
        VStack {
            Text("Third Level of Children")
            Text("Edit the following and you'll see the changes at the top level:")
            TextField("Edit this", text: $appWideData.userName)
            
        }
        .padding()
        .background(Color.yellow)
    }
}

struct SecondLevelOfChildren: View {
    var body: some View {
        VStack {
            Text("Second Level of Children")
            ThirdLevelOfChildren()
        }
        .padding()
        .background(Color.orange)
    }
}

struct FirstLevelOfChildren: View {
    var body: some View {
        VStack {
            Text("First Level of Children")
            Divider()
            Text("Children embedded directly within this view:")
            SecondLevelOfChildren()
                .padding()
        }
        .padding()
        .background(Color.red)
    }
}


struct ThirdLevelOfLinkedChildren: View {
    @EnvironmentObject var appWideData: AppData
    var body: some View {
        VStack {
            Text("Welcome to the Third Level of Linked Children")
            Text("Edit the following and you'll see the changes at the top level:")
            TextField("Edit this", text: $appWideData.userName)
            
        }
        .padding()
        .background(Color.yellow)
    }
}

struct SecondLevelOfLinkedChildren: View {
    var body: some View {
        VStack {
            Text("Welcome to the Second Level of Children")
            NavigationLink(destination: ThirdLevelOfLinkedChildren()) {
                Text("Go to the third level of linked children")
            }
            .padding()
            .font(.headline)
            .foregroundColor(.blue)
        }
        .padding()
        .background(Color.orange)
    }
}

struct FirstLevelOfLinkedChildren: View {
    var body: some View {
        VStack {
            Text("Welcome to the First Level of Linked Children")
            NavigationLink(destination: SecondLevelOfLinkedChildren()) {
                Text("Go to the second level of linked children")
            }
            .padding()
            .font(.headline)
            .foregroundColor(.blue)
        }
        .padding()
        .background(Color.red)
    }
}


struct MultiLevelSharingView_Previews: PreviewProvider {
    static var previews: some View {
        MultiLevelSharingView()
    }
}
