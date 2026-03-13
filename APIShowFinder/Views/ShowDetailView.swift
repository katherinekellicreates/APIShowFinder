//
//  ShowDetailView.swift
//  APIShowFinder
//
//  Created by Katherine Pizzirusso on 3/13/26.
//

import SwiftUI

struct ShowDetailView: View {
    
    let show: Show
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Show image
                if let imageURL = show.image?.medium,
                   let url = URL(string: imageURL) {
                    
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 200, height: 300)
                    .cornerRadius(10)
                }
                
                // Show name
                Text(show.name)
                    .font(.title)
                    .bold()
                
                // Genres
                               if !show.genres.isEmpty {
                                   HStack {
                                       ForEach(show.genres, id: \.self) { genre in
                                           Text(genre)
                                               .font(.caption)
                                               .padding(5)
                                               .background(Color.gray.opacity(0.2))
                                               .cornerRadius(5)
                                       }
                                   }
                               }
                
                // Summary
                if let summary = show.summary {
                    Text(summary.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression))
                        .padding()
                }
                
                // Where to Watch
                Text("Where to Watch")
                    .font(.headline)
                
                if let network = show.network?.name {
                    Text(network)
                } else if let web = show.webChannel?.name {
                    Text(web)
                } else {
                    Text("Unknown")
                }
               
            }
            .padding()
        }
    }
}
