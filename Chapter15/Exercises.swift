import SwiftUI


struct ExercisesView: View {
    @State var messageOne = ""
    
    var body: some View {
        VStack {
            Text("Exercises")
                .font(.largeTitle)
            Text("Your work goes here")
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
