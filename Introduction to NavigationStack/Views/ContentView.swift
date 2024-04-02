//
//  ContentView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 03/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath() // accepts any Hashable objects
    
    var body: some View {
        NavigationStack(path: $path) {
            
            List {
                Section("Foods") {
                    ForEach(foods) { food in
                        NavigationLink(value: food) {
                            MenuItemView(item: food)
                        }
                    }
                }
                
                Section("Drinks") {
                    ForEach(drinks) { drink in
                        NavigationLink(value: drink) {
                            MenuItemView(item: drink)
                        }
                    }
                }
                
                Section("Desserts") {
                    ForEach(desserts) { dessert in
                        NavigationLink(value: dessert) {
                            MenuItemView(item: dessert)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Menu")
            // for: type in navigationDestination must match Type of the NavigationLink value:
            .navigationDestination(for: Food.self) { item in
                FoodDetailView(food: item)
            }
            .navigationDestination(for: Drink.self) { item in
                DrinkDetailView(drink: item)
            }
            .navigationDestination(for: Dessert.self) { item in
               DessertDetailView(dessert: item)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("🪄 Surprise Me") {
                        // create an array of hashable objects and add all foods, drinks, and desserts
                        let items: [any Hashable] = foods + drinks + desserts
                        // now we can choose a random object of any type to add to our nav path
                        if let item = items.randomElement() {
                            path.append(item)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
