//
//  FoodItemView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 03/02/2023.
//

import SwiftUI

struct MenuItemView: View {
    
    let food: MenuItem
    
    var body: some View {
        LabeledContent {
            Text(food.price,
                 format: .currency(code: Locale.current.currency?.identifier ?? ""))
        } label: {
            Text("\(food.name) \(food.title)")
        }
    }
}

struct FoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(food: foods[0])
            .previewLayout(.sizeThatFits)
    }
}
