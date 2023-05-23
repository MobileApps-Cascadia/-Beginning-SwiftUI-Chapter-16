import SwiftUI

class RPGCharacter: ObservableObject, Identifiable, Equatable {
    static func == (lhs: RPGCharacter, rhs: RPGCharacter) -> Bool {
        lhs.id == rhs.id
    }
    
    var id = UUID()
    
    @Published var name: String
    @Published(wrappedValue: 100) var hitPoints: Int
    @Published(wrappedValue: 20) var damage: Int
    
    init(name: String, hitPoints: Int, damage: Int) {
        self.name = name
        self.hitPoints = hitPoints
        self.damage = damage
    }
}

class RPGCharacterStore: ObservableObject {
    @Published var characters: [RPGCharacter]
    
    init() {
        characters = [
            RPGCharacter(name: "Warrior", hitPoints: 100, damage: 20),
            RPGCharacter(name: "Mage", hitPoints: 80, damage: 30),
            RPGCharacter(name: "Rogue", hitPoints: 90, damage: 25)
        ]
    }
    
    func updateCharacter(_ character: RPGCharacter) {
        if let index = characters.firstIndex(where: { $0.id == character.id }) {
            characters[index] = character
        }
    }
}

struct ExercisesView: View {
    @StateObject private var characterStore = RPGCharacterStore()
    
    var body: some View {
        NavigationView {
            List(characterStore.characters) { character in
                NavigationLink(destination: CharacterDetailView(character: character, characterStore: characterStore)) {
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.headline)
                        Text("HP: \(character.hitPoints), DMG: \(character.damage)")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Characters")
        }
    }
}

struct CharacterDetailView: View {
    @ObservedObject var character: RPGCharacter
    @ObservedObject var characterStore: RPGCharacterStore
    
    var body: some View {
        VStack {
            TextField("Name", text: $character.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Stepper(value: $character.hitPoints, in: 0...100, step: 1) {
                Text("Hit Points: \(character.hitPoints)")
            }
            .padding()
            
            Stepper(value: $character.damage, in: 0...50, step: 5) {
                Text("Damage: \(character.damage)")
            }
            .padding()
        }
        .navigationTitle(character.name)
        .onDisappear {
            characterStore.updateCharacter(character)
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
