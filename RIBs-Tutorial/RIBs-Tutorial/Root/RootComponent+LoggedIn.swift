//
//  RootComponent+LoggedIn.swift
//  RIBs-Tutorial
//
//  Created by 김소연 on 11/7/23.
//

import RIBs

protocol RootDependencyLoggedIn: Dependency {
    
}

extension RootComponent: LoggedInDependency {
    
    var LoggedInViewController: LoggedInViewControllable {
        return rootViewController
    }
    
}
