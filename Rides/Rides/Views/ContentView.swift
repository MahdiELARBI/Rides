//
//  ContentView.swift
//  Rides
//
//  Created by Mahdi Elarbi on 2024-09-16.
//

import SwiftUI

enum SortField: String, CaseIterable {
    case vin, model
}

struct ContentView: View {
    
    // used for the static implementaion
    // @State var menu = Bundle.main.decode([VehiculeItem].self, from: "menu.json")
    
    @ObservedObject var viewModel: VehiculeListVM
    @State private var selectedSortField: SortField = .vin
    @State var sortReverse = false
    @StateObject var themeManager = ThemeManager()
    
    var body: some View {
        NavigationStack {
            // Creating The search part
            HStack(alignment: .top) {
                TextField("Write your Number", text: $viewModel.searchText, axis: .vertical)
                    .padding(.trailing, 25)
                    .padding(9)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(uiColor: .clear))
                            .background(Color.gray.opacity(0.1)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                            )
                    )
                    .padding(.leading, 20)
                Button(action: {
                    viewModel.searchForVehicules()
                } ) {
                    Text("Search")
                }
                .padding(9)
            }
            
            // Creating The Vehicule part
            List {
                Section {
                    ForEach(viewModel.vehiculeResults, id: \.self) { item in
                        NavigationLink(value: item) {
                            VehiculeRow(item: item).environmentObject(themeManager)
                        }
                    }
                } header: {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Sort by :")
                        HStack {
                            Picker("Sorting methods", selection: $selectedSortField) {
                                Text("Vin")
                                Text("Model")
                            }
                            .onTapGesture(count: 1) { // <-- here
                                sortReverse.toggle()
                                sort()
                            }
                            .pickerStyle(.segmented)
                        }
                    }
                    .onChange(of: selectedSortField) { sortOrder in
                        withAnimation {
                            sortReverse = false  // <-- here
                            sort()
                        }
                    }
                    .onAppear() {
                        sort()
                    }
                }
            }
            .navigationDestination(for: VehiculeItem.self, destination: { item in
                VehiculeDetails(item: item).environmentObject(themeManager)
            })
            .navigationTitle("Vehicle List")
            .listStyle(.grouped) // To change the list type
            Spacer()
        }
    }
    
    // Sort list when clicking on the picker
    private func sort() {
        switch selectedSortField {
        case .vin: viewModel.vehiculeResults.sort (by: sortReverse ? { $0.vin! > $1.vin! } : { $0.vin! < $1.vin! } )
        case .model: viewModel.vehiculeResults.sort (by: sortReverse ? { $0.make_and_model! > $1.make_and_model! } : { $0.make_and_model! < $1.make_and_model! } )
        }
    }
}

#Preview {
    ContentView(viewModel: VehiculeListVM())
}
