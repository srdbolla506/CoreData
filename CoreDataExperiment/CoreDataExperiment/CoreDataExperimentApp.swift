//
//  CoreDataExperimentApp.swift
//  CoreDataExperiment
//
//  Created by Sri Divya Bolla on 27/02/21.
//

import SwiftUI

@main
struct CoreDataExperimentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
