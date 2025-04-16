//
//  DatabaseManager.swift
//  MyPasswordManagmentApplication
//
//  Created by Sourabh Modi on 16/04/25.
//

import Foundation
import CoreData
import UIKit

class DatabaseManager: ObservableObject {
   
    let container: NSPersistentContainer
    @Published var savedEntities: [AccountDetailEntity] = []

    init() {
        container = NSPersistentContainer(name: "MyPasswordManagmentApplication")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error in loading core data")
            }
        }
    }
    // Add Users
    func addUser(accountDetails: PasswordDetailModel) {
       
        let newAccount = AccountDetailEntity(context: container.viewContext)
        newAccount.email = accountDetails.email
        newAccount.userName = accountDetails.username
        newAccount.accountName = accountDetails.accountName
        newAccount.password = accountDetails.password

           do {
               try container.viewContext.save()
               fetchUserData()
           } catch {
               print("Failed to save account: \(error)")
           }
    }
    // Fetch Users
    func fetchUserData() -> [AccountDetailEntity] {
        var accountData: [AccountDetailEntity] = []
        
        do {
            accountData = try container.viewContext.fetch(AccountDetailEntity.fetchRequest())
        }catch {
            print("Error in fetching data")
        }
        return accountData
    }
}
