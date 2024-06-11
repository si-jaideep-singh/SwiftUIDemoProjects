//
//  ServiceManager.swift
//  KKRDemo
//
//  Created by Jaideep Singh on 11/06/24.
//

import Foundation
import Combine

class ServiceManager {
    static let shared = ServiceManager() // Singleton instance
    
    private init() {} // Private initializer to prevent external instantiation
    
    func fetchData() -> AnyPublisher<[SIFeedsListingItem], Error> {
        guard let url = URL(string: "https://www.knightclub.in/apiv4/listing?entities=172,4&otherent=&exclent=&pgnum=1&inum=10&pgsize=10") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [SIFeedsListingItem].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
