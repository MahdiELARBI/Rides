//
//  VehiculeRow.swift
//  Rides
//
//  Created by Mahdi Elarbi on 2024-09-18.
//

import SwiftUI

struct VehiculeRow: View {
    let item: VehiculeItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.make_and_model ?? "")
                .font(.headline)
            Text(item.vin ?? "")
        }
    }
}

#Preview {
    VehiculeRow(item: VehiculeItem.example)
}
