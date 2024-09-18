//
//  VehiculeDetails.swift
//  Rides
//
//  Created by Mahdi Elarbi on 2024-09-18.
//

import SwiftUI

struct VehiculeDetails: View {
    let item: VehiculeItem
    @EnvironmentObject private var themeManager: ThemeManager
    
    var body: some View {
        
        // Details list for Vin, Model, Color and Type
        List {
            if let vin = item.vin {
                HStack {
                    Text("Vehicule Vin :")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(themeManager.selectedTheme.captionTxtFont)
                        .foregroundColor(themeManager.selectedTheme.textBoxColor)
                    Text(vin)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(themeManager.selectedTheme.bodyTextFont)
                        .foregroundColor(themeManager.selectedTheme.secondoryThemeColor)
                }
                
            }
            if let model = item.make_and_model {
                HStack {
                    Text("Vehicule Model :")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(themeManager.selectedTheme.captionTxtFont)
                        .foregroundColor(themeManager.selectedTheme.textBoxColor)
                    Text(model)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(themeManager.selectedTheme.bodyTextFont)
                        .foregroundColor(themeManager.selectedTheme.secondoryThemeColor)
                }
            }
            
            if let color = item.color {
                HStack {
                    Text("Vehicule Color :")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(themeManager.selectedTheme.captionTxtFont)
                        .foregroundColor(themeManager.selectedTheme.textBoxColor)
                    Text(color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(themeManager.selectedTheme.bodyTextFont)
                        .foregroundColor(themeManager.selectedTheme.secondoryThemeColor)
                }
            }
            
            if let type = item.car_type {
                HStack {
                    Text("Vehicule Type :")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(themeManager.selectedTheme.captionTxtFont)
                        .foregroundColor(themeManager.selectedTheme.textBoxColor)
                    Text(type)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(themeManager.selectedTheme.bodyTextFont)
                        .foregroundColor(themeManager.selectedTheme.secondoryThemeColor)
                }
            }
        }
        .navigationTitle(item.make_and_model ?? "")
        .navigationBarTitleDisplayMode(.inline)
    
    }
}

#Preview {
    NavigationStack {
        VehiculeDetails(item: VehiculeItem.example)
    }
}
