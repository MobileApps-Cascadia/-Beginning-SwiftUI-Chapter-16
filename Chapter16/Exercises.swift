import SwiftUI

class RPGCharacter: Identifiable, Equatable {
    static func == (lhs: RPGCharacter, rhs: RPGCharacter) -> Bool {
        lhs.id == rhs.id
    }
    
    var id = UUID()
    
    var name: String
    var hitPoints: Int
    var damage: Int
    
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
    
    func addCharacter() {
        let newCharacter = RPGCharacter(name: "New Character", hitPoints: 100, damage: 10)
        characters.append(newCharacter)
    }
}

struct ExercisesView: View {
    @StateObject private var characterStore = RPGCharacterStore()
    
    var body: some View {
        NavigationView {
            List(characterStore.characters) { character in
                NavigationLink(destination: CharacterDetailView(character: characterBinding(for: character), characterStore: characterStore)) {
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.headline)
                        Text("HP: \(character.hitPoints), DMG: \(character.damage)")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Characters")
            .navigationBarItems(trailing:
                Button(action: {
                    characterStore.addCharacter()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                }
            )
        }
    }
    
    private func characterBinding(for character: RPGCharacter) -> Binding<RPGCharacter> {
        guard let index = characterStore.characters.firstIndex(where: { $0.id == character.id }) else {
            fatalError("Character not found in store")
        }
        
        return $characterStore.characters[index]
    }
}

struct CharacterDetailView: View {
    @Binding var character: RPGCharacter
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
