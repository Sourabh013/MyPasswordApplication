//
//  HomeController.swift
//  MyPasswordManagmentApplication
//
//  Created by Sourabh Modi on 16/04/25.
//

import SwiftUI

struct HomeController: View {
    let accounts = ["Google", "Linkedin", "Twitter", "Facebook", "Instagram"]
    @State var showAddAccountView = false
    @State private var selectedAccount: String?
    @State private var showDetails = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Password Manager")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                        .padding(.horizontal)
                    
                    ForEach(accounts, id: \.self) { account in
                        HStack {
                            Text(account)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text("*******")
                                .foregroundColor(.gray)
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                        .padding(.horizontal)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedAccount = account
                            showDetails = true
                        }
                    }
                    
                    Spacer()
                }
                .background(Color(.systemGray6))
                
                Button(action: {
                    showAddAccountView = true
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .shadow(radius: 5)
                }
                .padding()
            }
                .navigationBarHidden(true)
                .sheet(isPresented: $showAddAccountView) {
                    AddNewAccountController()
                        .presentationDetents([.fraction(0.45)])
                        .presentationCornerRadius(15)
                }
           
            .sheet(isPresented: $showDetails) {
                if let selectedAccount = selectedAccount {
                    AccountUpdateController(account: selectedAccount)
                        .presentationDetents([.fraction(0.45)])
                        .presentationCornerRadius(15)
                }
            }
        }
    }
}
#Preview {
    HomeController()
}
