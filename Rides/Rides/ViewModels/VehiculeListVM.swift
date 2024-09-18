//
//  VehiculeListVM.swift
//  Rides
//
//  Created by Mahdi Elarbi on 2024-09-18.
//

import Foundation
import SwiftUI
import Combine

class VehiculeListVM: ObservableObject {
    @Published var searchText = ""
    @Published var vehiculeResults: [VehiculeItem] = []

    private var searchPublisher: AnyPublisher<[VehiculeItem], APIError>?
    
    private var searchCancellable: AnyCancellable? {
        willSet {
            searchCancellable?.cancel()
        }
    }
    
    private var disposables = Set<AnyCancellable>()
    
    init() {
     
     // I added this code to test if my list updates when the text changes without clicking the button. I left it commented since it's not required.
     /*   $searchText
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink(receiveValue: searchForVehicules())
            .store(in: &disposables)*/
    }

    
    func searchForVehicules() {
                
        searchCancellable = RidesAPIManager
            .searchVehicule(size: searchText)
            .replaceError(with: [VehiculeItem.example])
            .map{$0.self}
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .assign(to: \.vehiculeResults, on: self)
                                
    }
    
}
