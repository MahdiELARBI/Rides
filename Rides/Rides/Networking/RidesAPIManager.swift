//
//  RidesAPIManager.swift
//  Rides
//
//  Created by Mahdi Elarbi on 2024-09-18.
//

import Foundation
import Combine

protocol RidesAPIManagerActions {
    static func searchVehicule(size: String) -> AnyPublisher<[VehiculeItem], APIError>
}

struct RidesAPIManager: RidesAPIManagerActions {
    
    static let baseURL = "https://random-data-api.com/api/"
    
    // Search for Vehicules API call
    public static func searchVehicule(size: String) -> AnyPublisher<[VehiculeItem], APIError> {
        
        let searchURL = URL(string: "\(baseURL)vehicle/random_vehicle?size=\(size)")!
        let components = URLComponents(url: searchURL, resolvingAgainstBaseURL: true)

        return URLSession.shared.dataTaskPublisher(for: components!.url!)
        .map { $0.data }
        .decode(type: [VehiculeItem].self, decoder: decoder)
        .mapError{ APIError.parseError(reason: "\($0)") }
        .eraseToAnyPublisher()
    }

    private static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
}


public enum APIError: Error, Equatable {

    case unknown
    case message(reason: String)
    case parseError(reason: String)
    
    static func processResponse(data: Data, response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.unknown
        }
        if (httpResponse.statusCode == 404) {
            throw APIError.message(reason: "Resource not found");
        }
        return data
    }
}
