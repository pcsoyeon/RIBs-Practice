//
//  RootComponent+LoggedIn.swift
//  Memo
//
//  Created by 김소연 on 11/9/23.
//

import RIBs

protocol RootComponentLoggedIn: Dependency {
    
}

extension RootComponent: LoggedInDependency {
    
    var loggedInViewController: LoggedInViewControllable {
        return rootViewController
    }
    
}
