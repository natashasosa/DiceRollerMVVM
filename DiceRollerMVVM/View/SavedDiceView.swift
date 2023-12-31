//
//  RolledDiceView.swift
//  DiceRoller
//
//  Created by Natasha Rebelo on 16/10/23.
//

import SwiftUI

struct SavedDiceView: View {

    @StateObject var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.savedDice.count < 1 {
                    VStack {
                        Image(systemName: "dice.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                            .padding(.bottom, 20)

                        Text("You haven't saved any dice yet.")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                } else {
                    List {
                        ForEach(viewModel.savedDice) { dice in
                            NavigationLink {
                                SavedDiceDetailView(dice: dice)
                            } label: {
                                HStack {
                                    Image(systemName: "dice.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 55, height: 55)
                                        .clipShape(Circle())

                                    VStack(alignment: .leading) {
                                        Text("Dice rolled: \(dice.numberOfDice)")
                                            .font(.headline)

                                        Text("Dice type: \(dice.diceFaces)-sided.")
                                            .font(.body)
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                        .onDelete { indices in
                            if let indexToDelete = indices.first {
                                let diceToDelete = viewModel.savedDice[indexToDelete]
                                viewModel.deleteDice(withID: diceToDelete.id)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Saved Dice")
        }
    }
}

//struct RolledDiceView_Previews: PreviewProvider {
//    static var previews: some View {
//        RolledDiceView()
//    }
//}
