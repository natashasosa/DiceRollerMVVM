//
//  AppStorage.swift
//  DiceRollerMVVM
//
//  Created by Natasha Rebelo on 28/11/23.
//

import Foundation

class AppStorage {
    static let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedDice")

    static func loadDice() -> [Dice] {
        let savedDice: [Dice]

        do {
            let data = try Data(contentsOf: savePath)
            savedDice = try JSONDecoder().decode([Dice].self, from: data)
        } catch {
            savedDice = []
        }

        return savedDice
    }

    static func saveDice(savedDice: [Dice]) {
        do {
            let data = try JSONEncoder().encode(savedDice)
            try data.write(to: savePath)
        } catch {
            print("Error saving people: \(error)")
        }
    }
}
