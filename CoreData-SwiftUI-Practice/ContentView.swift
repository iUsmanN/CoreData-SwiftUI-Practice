//
//  ContentView.swift
//  CoreData-SwiftUI-Practice
//
//  Created by Usman on 12/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var movieTitle: String = ""
    @State private var movies: [Movie] = []
    let coreDataManager : CoreDataManager
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter movie name: ", text: $movieTitle)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button("Save") {
                    coreDataManager.saveMovie(title: movieTitle)
                    self.movieTitle = ""
                    self.movies = coreDataManager.getMovies()
                }
                
                List {
                    ForEach(movies, id: \.self) { movie in
                        Text(movie.title ?? "")
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let movie = movies[index]
                            coreDataManager.deleteMovie(movie: movie)
                            self.movies = coreDataManager.getMovies()
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("Movies")
            .onAppear(perform: {
                self.movies = coreDataManager.getMovies()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDataManager: CoreDataManager())
    }
}
