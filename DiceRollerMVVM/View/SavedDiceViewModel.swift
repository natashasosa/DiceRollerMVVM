//
//  SavedDices.swift
//  DiceRoller
//
//  Created by Natasha Rebelo on 16/10/23.
//

import Foundation

extension SavedDiceView {

    @MainActor
    class ViewModel: ObservableObject {

        @Published var savedDice: [Dice] = AppStorage.loadDice()

//        init() {
//            do {
//                let data = try Data(contentsOf: AppStorage.savePath)
//                savedDice = try JSONDecoder().decode([Dice].self, from: data)
//            } catch {
//                savedDice = []
//            }
//        }

        func refreshDice() {
            savedDice = AppStorage.loadDice()
        }

        //tirar
        func saveDice() {
            do {
                let data = try JSONEncoder().encode(savedDice)
                try data.write(to: AppStorage.savePath)
            } catch {
                print("Error saving people: \(error)")
            }
        }

        func deleteDice(withID id: UUID) {
            if let index = savedDice.firstIndex(where: { $0.id == id }) {
                savedDice.remove(at: index)
                saveDice() // Save the updated data after deletion
            }
        }
    }
}
