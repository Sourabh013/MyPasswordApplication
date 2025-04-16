//
//  PasswordDetailModel.swift
//  MyPasswordManagmentApplication
//
//  Created by Sourabh Modi on 16/04/25.
//

import Foundation


class PasswordDetailModel: Identifiable, ObservableObject {
    var id = UUID()
    var accountName: String
    var username: String
    var password: String
    var email: String?
    init(accountName: String, username: String, password: String, email: String) {
        self.accountName = accountName
        self.username = username
        self.password = password
        self.email = email
    }
}
