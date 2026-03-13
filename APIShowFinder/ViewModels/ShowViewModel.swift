//
//  ShowViewModel.swift
//  APIShowFinder
//
//  Created by Katherine Pizzirusso on 3/13/26.
//

import Foundation
import Combine

class ShowViewModel: ObservableObject {
    
    @Published var shows: [Show] = []
    
    func fetchShows() {
        
        guard let url = URL(string: "https://api.tvmaze.com/shows") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            
            if let decoded = try? JSONDecoder().decode([Show].self, from: data) {
                
                DispatchQueue.main.async {
                    self.shows = Array(decoded.prefix(250))
                }
            }
            
        }.resume()
    }
}
