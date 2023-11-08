//
//  AppComponent.swift
//  Memo
//
//  Created by 소연 on 2023/11/09.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    
    init() {
        super.init(dependency: EmptyComponent())
    }
    
}
