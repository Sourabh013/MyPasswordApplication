//
//  AccountUpdateController.swift
//  MyPasswordManagmentApplication
//
//  Created by Sourabh Modi on 16/04/25.
//

import SwiftUI

struct AccountUpdateController: View {
    let account: String
    @State private var username: String = "user@example.com"
    @State private var password: String = "yourSecretPassword123"
    @State private var isShowingPassword: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Capsule()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 40, height: 5)
                .padding(.top, 10)
            
            Text("Account Details")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.blue)
                .padding(.top, 10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Account Type")
                    .font(.caption)
                    .foregroundStyle(.gray)
                Text(account)
                    .font(.headline)
                
                Text("Username/ Email")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(username)
                    .font(.headline)
                
                Text("Password")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack {
                    Text(isShowingPassword ? password : String(repeating: "*", count: password.count))
                        .font(.headline)
                    Spacer()
                    Button(action: {
                        isShowingPassword.toggle()
                    }) {
                        Image(systemName: isShowingPassword ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.horizontal)
            
            HStack(spacing: 20) {
                Button(action: {
                    // Handle edit
                }) {
                    Text("Edit")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(20)
                }

                Button(action: {
                    // Handle delete
                }) {
                    Text("Delete")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(20)
                }
            }
            .padding(.horizontal)
            .padding(.top)

            Spacer()
        }
        .background(Color(.systemGray6))
    }
}

#Preview {
    AccountUpdateController(account: "account")
}
