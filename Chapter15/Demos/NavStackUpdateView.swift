
import SwiftUI

struct NavStackUpdateView: View {
    @State var flag = true
    var body: some View {
        NavigationStack {
            VStack {
                NestedLink(myColors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple], myLevel: 1)
                
                .navigationTitle("Navigation Title")
            }
        }
    }
}

struct NavStackUpdateView_Previews: PreviewProvider {
    static var previews: some View {
        NavStackUpdateView()
    }
}


struct NestedLink: View {
    var myColors: [Color]
    var remainingColors: [Color] {
        Array(myColors[1..<myColors.count])
    }
    var myLevel: Int
    
    
    var body: some View {
        HStack {
            VStack {
                Text("This is level \(myLevel)")
                if myColors.count > 1 {
                    NavigationLink(destination: NestedLink(myColors: remainingColors, myLevel: myLevel + 1)) {
                        Text("Separate file link")
                    }
                    .padding()
                    .foregroundColor(.black)
                    .underline()
                }
                else {
                    Text("Bottom level")
                }
            }
        }
        .padding()
        .background(myColors[0])
    }
}
