

import SwiftUI

struct NavSepFilesView: View {
    @State var flag = true
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: FileView()) {
                    Text("Link to structure in same file")
                }
                .padding()
                .font(.headline)
                .foregroundColor(.blue)
                
                NavigationLink(destination: SeparateFileView()) {
                    Text("Separate file link")
                }
                .padding()
                .font(.headline)
                .foregroundColor(.blue)
                
                
                .navigationTitle("Navigation Title")
            }
        }
    }
}

struct NavSepFilesView_Previews: PreviewProvider {
    static var previews: some View {
        NavSepFilesView()
    }
}


struct FileView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Text("This is a separate structure")
                Text("that's stored in the same file")
                Spacer()
            }
            Spacer()
        }.background(Color.yellow)
    }
}
