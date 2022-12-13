//
//  CoreData_SwiftUI_PracticeApp.swift
//  CoreData-SwiftUI-Practice
//
//  Created by Usman on 12/12/2022.
//

import SwiftUI

@main
struct CoreData_SwiftUI_PracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDataManager: CoreDataManager())
        }
    }
}
