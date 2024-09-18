//
//  Vehicule.swift
//  Rides
//
//  Created by Mahdi Elarbi on 2024-09-18.
//

import SwiftUI

struct VehiculeItem: Codable, Hashable, Identifiable {
    let id : Int?
    let uid : String?
    let vin : String?
    let make_and_model : String?
    let color : String?
    let transmission : String?
    let drive_type : String?
    let fuel_type : String?
    let car_type : String?
    let car_options : [String]?
    let specs : [String]?
    let doors : Int?
    let mileage : Int?
    let kilometrage : Int?
    let license_plate : String?
    
    #if DEBUG
    // Default example for the view and for the error case.
    static let example = VehiculeItem(id: 1,
                                  uid: "test uid",
                                  vin: "test vin",
                                  make_and_model: "test make_and_model",
                                  color: "test color",
                                  transmission: "test transmission",
                                  drive_type: "test drive_type",
                                  fuel_type: "test fuel_type",
                                  car_type: "test car_type",
                                  car_options: [],
                                  specs: [],
                                  doors: 0,
                                  mileage: 0,
                                  kilometrage: 0,
                                  license_plate: "test license_plate")
    #endif
}
