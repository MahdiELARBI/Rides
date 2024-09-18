//
//  VehiculeRow.swift
//  Rides
//
//  Created by Mahdi Elarbi on 2024-09-18.
//

import SwiftUI

struct VehiculeRow: View {
    let item: VehiculeItem
    @EnvironmentObject private var themeManager: ThemeManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.make_and_model ?? "")
                .font(themeManager.selectedTheme.textTitleFont)
                .foregroundColor(themeManager.selectedTheme.primaryThemeColor)
            Text(item.vin ?? "")
                .font(themeManager.selectedTheme.normalBtnTitleFont)
                .foregroundColor(themeManager.selectedTheme.negativeBtnTitleColor)
        }
    }
}

#Preview {
    VehiculeRow(item: VehiculeItem.example)
}
