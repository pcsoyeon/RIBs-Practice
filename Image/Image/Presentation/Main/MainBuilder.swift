//
//  MainBuilder.swift
//  Image
//
//  Created by 김소연 on 11/13/23.
//

import RIBs

protocol MainDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class MainComponent: Component<MainDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol MainBuildable: Buildable {
    func build() -> LaunchRouting
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {

    override init(dependency: MainDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = MainComponent(dependency: dependency)
        let viewController = MainViewController()
        let interactor = MainInteractor(
            presenter: viewController,
            initialState: .init()
        )
//        interactor.listener = listener
        
        return LaunchRouter(
            interactor: interactor,
            viewController: viewController
        )
    }
    
}
