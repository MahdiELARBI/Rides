//
//  VehiculeDetails.swift
//  Rides
//
//  Created by Mahdi Elarbi on 2024-09-18.
//

import SwiftUI

struct VehiculeDetails: View {
    let item: VehiculeItem
    
    var body: some View {
        
        // Details list for Vin, Model, Color and Type
        List {
            if let vin = item.vin {
                HStack {
                    Text("Vehicule Vin :")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(vin)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }
            if let model = item.make_and_model {
                HStack {
                    Text("Vehicule Model :")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(model)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            if let color = item.color {
                HStack {
                    Text("Vehicule Color :")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            if let type = item.car_type {
                HStack {
                    Text("Vehicule Type :")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(type)
                        .frame(maxWidth: .infinity, alignment: .leading)
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
