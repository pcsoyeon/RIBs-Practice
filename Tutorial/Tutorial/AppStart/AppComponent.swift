//
//  AppComponent.swift
//  Tutorial
//
//  Created by 김소연 on 11/8/23.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
    
}
