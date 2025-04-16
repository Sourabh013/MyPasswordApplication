//
//  MyPasswordManagmentApplicationApp.swift
//  MyPasswordManagmentApplication
//
//  Created by Sourabh Modi on 16/04/25.
//

import SwiftUI

@main
struct MyPasswordManagmentApplicationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
          //  ContentView()
            HomeController()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
