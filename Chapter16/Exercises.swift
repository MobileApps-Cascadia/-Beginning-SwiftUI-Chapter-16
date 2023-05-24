import SwiftUI

class Characters : ObservableObject {
    // Just so you're not confused, these are my dnd characters with their lowest damage if all their attacks hit on an action
    @Published var array = [Character(name: "Alex", hp: "80", dmg: "12"), Character(name: "Deedee", hp: "56", dmg: "14"), Character(name: "Silvy", hp: "77", dmg: "32")]
}

struct ExercisesView: View {
    @StateObject var theData = Characters()
    @State var name = ""
    @State var hp = ""
    @State var dmg = ""
    
    var body: some View {
        NavigationStack {
           List($theData.array) { $character in
                NavigationLink(destination: CharacterDetails(characterInfo: $character)) {
                    Text("\(character.name)")
                }
            }
           .navigationBarTitle("Exercises")
            .toolbarBackground(Color.purple.opacity(0.2), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .accentColor(.purple)
    }
}

struct CharacterDetails: View {
    @Binding var characterInfo: Character
    var body: some View{
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                TextEditor(text: $characterInfo.name)
                                .padding()
                                .autocorrectionDisabled()
                                .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 65
                                )
            }
            
            HStack{
                Text("Hit Points: ")
                TextEditor(text: $characterInfo.hp)
                    .padding()
                    .autocorrectionDisabled()
                    .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 65
                    )
            }
            
            HStack{
                Text("Damage: ")
                TextEditor(text: $characterInfo.dmg)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocorrectionDisabled()
                    .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 65
                    )
            }
        }.navigationTitle("\(characterInfo.name)'s info")
         .toolbarBackground(Color.purple.opacity(0.2), for: .navigationBar)
         .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct Character: Identifiable {
    let id = UUID()
    var name: String
    var hp: String
    var dmg: String
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
