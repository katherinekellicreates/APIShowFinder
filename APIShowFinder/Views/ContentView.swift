//
//  ContentView.swift
//  APIShowFinder
//
//  Created by Katherine Pizzirusso on 3/12/26.
//
import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ShowViewModel()
    
    var body: some View {
        
        NavigationView {
            
            List(viewModel.shows) { show in
                
                NavigationLink(destination: ShowDetailView(show: show)) {
                    
                    HStack {
                        
                        if let imageURL = show.image?.medium,
                           let url = URL(string: imageURL) {
                            
                            AsyncImage(url: url) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 70)
                        }
                        
                        Text(show.name)
                    }
                }
            }
            .navigationTitle("TV Shows")
        }
        .onAppear {
            viewModel.fetchShows()
        }
    }
}

#Preview {
    ContentView()
}
