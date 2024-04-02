//
//  ContentView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 03/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            
            List {
                
                ForEach(foods) { food in
                    NavigationLink(value: food) {
                        FoodItemView(food: food)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Menu")
            // for: type in navigationDestination must match Type of the NavigationLink value:
            .navigationDestination(for: Food.self) { item in
                FoodDetailView(food: item)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
