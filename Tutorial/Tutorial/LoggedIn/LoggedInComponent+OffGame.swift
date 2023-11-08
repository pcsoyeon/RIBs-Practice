//
//  LoggedInComponent+OffGame.swift
//  Tutorial
//
//  Created by 김소연 on 11/8/23.
//

import RIBs

/// The dependencies needed from the parent scope of LoggedIn to provide for the OffGame scope.
// TODO: Update LoggedInDependency protocol to inherit this protocol.
protocol LoggedInDependencyOffGame: Dependency {

    // TODO: Declare dependencies needed from the parent scope of LoggedIn to provide dependencies
    // for the OffGame scope.
}

extension LoggedInComponent: OffGameDependency {

    // TODO: Implement properties to provide for OffGame scope.
}
