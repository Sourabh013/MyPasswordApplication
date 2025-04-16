//
//  AddNewAccountController.swift
//  MyPasswordManagmentApplication
//
//  Created by Sourabh Modi on 16/04/25.
//

import SwiftUI

struct AddNewAccountController: View {
    @State private var accountName = ""
        @State private var username = ""
        @State private var password = ""
    @State private var email = ""
    @State private var showAlert = false
        @State private var alertMessage = ""
    @StateObject var databaseManager = DatabaseManager()
    
        var body: some View {
            VStack(spacing: 20) {
                Capsule()
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 40, height: 5)
                    .padding(.top, 10)
                
                TextField("Account Name", text: $accountName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                    .padding(.horizontal)
                
                TextField("Username/ Email", text: $username)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                    .padding(.horizontal)
                
                Button(action: {
                               if accountName.isEmpty {
                                   alertMessage = "Account Name is required."
                                   showAlert = true
                               } else if username.isEmpty {
                                   alertMessage = "Username/Email is required."
                                   showAlert = true
                               } else if password.isEmpty {
                                   alertMessage = "Password is required."
                                   showAlert = true
                               } else {
                                   let newEntry = PasswordDetailModel(
                                       accountName: accountName,
                                       username: username,
                                       password: password,
                                       email: email
                                   )
                                   databaseManager.addUser(accountDetails: newEntry)
                                   
                                   // Clear fields
                                   accountName = ""
                                   username = ""
                                   password = ""
                                   email = ""
                               }
                           })  {
                    Text("Add New Account")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(20)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .background(Color(.systemGray6))
            .alert(isPresented: $showAlert) {
                        Alert(title: Text("Missing Information"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }
        }
    }

#Preview {
    AddNewAccountController()
}
