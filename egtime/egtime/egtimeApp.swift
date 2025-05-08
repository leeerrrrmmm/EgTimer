//
//  egtimeApp.swift
//  egtime
//
//  Created by .Leeerrrmmm . on 05.05.2025.
//

import SwiftUI

@main
struct egtimeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
