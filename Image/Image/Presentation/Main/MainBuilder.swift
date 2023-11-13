//
//  MainBuilder.swift
//  Image
//
//  Created by 김소연 on 11/13/23.
//

import RIBs

protocol MainDependency: Dependency {
    var mainRepository: MainRepository { get }
}

final class MainComponent: Component<MainDependency>, DetailDependency {

    fileprivate var initiailState: MainPresentableState {
        MainPresentableState()
    }
    
}

// MARK: - Builder

protocol MainBuildable: Buildable {
    func build() -> LaunchRouting
}

final class MainBuilder: 
    SimpleComponentizedBuilder<MainComponent, LaunchRouting>,
    MainBuildable
{

    override func build(with component: MainComponent) -> LaunchRouting {
        let viewController = MainViewController()
        let interactor = MainInteractor(
            presenter: viewController,
            initialState: component.initiailState,
            repository: component.dependency.mainRepository
        )
        
        let detailBuilder = DetailBuilder(dependency: component)
        
        return MainRouter(
            interactor: interactor,
            viewController: viewController,
            detailBuilder: detailBuilder
        )
    }
    
}
