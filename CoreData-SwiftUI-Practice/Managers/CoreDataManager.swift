//
//  CoreDataManager.swift
//  CoreData-SwiftUI-Practice
//
//  Created by Usman on 12/12/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        self.persistentContainer = NSPersistentContainer(name: "DataModel")
        persistentContainer.loadPersistentStores { NSEntityDescription, error in
            if let error = error {
                fatalError("Core Data Store Failed: \(error.localizedDescription)")
            }
        }
    }
    
    func saveMovie(title: String) {
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = title

        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Error")
        }
    }
    
    func deleteMovie(movie: Movie) {
        persistentContainer.viewContext.delete(movie)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Error while deleting")
        }
    }
    
    func getMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
}
