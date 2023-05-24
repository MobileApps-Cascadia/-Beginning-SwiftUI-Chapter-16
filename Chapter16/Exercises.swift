import SwiftUI

class Champs: ObservableObject, Identifiable, Equatable {
     static func == (lhs: Champs, rhs: Champs) -> Bool {
         lhs.id == rhs.id
     }

     var id = UUID()

     @Published var name: String
     @Published(wrappedValue: 10) var hitPoints: Int
     @Published(wrappedValue: 20) var damage: Int

     init(name: String, hp: Int, dmg: Int) {
         self.name = name
         self.hitPoints = hp
         self.damage = dmg
     }
 }

 class Laners: ObservableObject {
     @Published var Champions: [Champs]

     init() {
         Champions = [
             Champs(name: "Top", hp: 150, dmg: 50),
             Champs(name: "Mid", hp: 100, dmg: 100),
             Champs(name: "Bottom", hp: 50, dmg: 150)
         ]
     }

     func updateChampion(_ character: Champs) {
         if let index = Champions.firstIndex(where: { $0.id == character.id }) {
             Champions[index] = character
         }
     }
 }

 struct ExercisesView: View {
     @StateObject private var ChampionPool = Laners()

     var body: some View {
         NavigationView {
             List(ChampionPool.Champions) { character in
                 NavigationLink(destination: CharacterDetailView(Champions: character, LanePicks: ChampionPool)) {
                     VStack {
                         Text(character.name)
                         Text("HP: \(character.hitPoints), DMG: \(character.damage)")
                     }
                 }
             }
             .frame(width:400 ,height: 600)
             .listStyle(.plain)
             .navigationTitle("League Laners")
         }
     }
 }

 struct CharacterDetailView: View {
     @ObservedObject var Champions: Champs
     @ObservedObject var LanePicks: Laners

     var body: some View {
         VStack {
             TextField("Champion Name", text: $Champions.name)
                 .padding()

             Stepper(value: $Champions.hitPoints, in: 0...10000, step: 150) {
                 Text("Health: \(Champions.hitPoints)")
             }
             .padding()

             Stepper(value: $Champions.damage, in: 0...1000, step: 50) {
                 Text("Attack Damage: \(Champions.damage)")
             }
             .padding()
         }
         .navigationTitle(Champions.name)
         .onDisappear {
             LanePicks.updateChampion(Champions)
         }
     }
 }
