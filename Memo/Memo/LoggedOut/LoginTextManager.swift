//
//  LoginTextManager.swift
//  Memo
//
//  Created by 김소연 on 11/9/23.
//

import Foundation

class LoginTextInputManager {
    class func isValidEmail(_ email: String) -> Bool {
        return email.count >= 5
    }
    
    class func isValidPassword(_ password: String) -> Bool {
        return password.count >= 5
    }
}
