//
//  ContentView.swift
//  DiceRollerMVVM
//
//  Created by Natasha Rebelo on 28/11/23.
//

import SwiftUI

struct ContentView: View {

    @State private var selectedTab = "Roll"

    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                RollView()
                    .tabItem {
                        Label("Roll", systemImage: "dice.fill")
                    }
                    .tag("Roll")

                SavedDiceView()
                    .tabItem {
                        Label("Saved", systemImage: "square.and.arrow.down.fill")
                    }
                    .tag("Saved")
            }
            .toolbarBackground(.black, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}

#Preview {
    ContentView()
}
