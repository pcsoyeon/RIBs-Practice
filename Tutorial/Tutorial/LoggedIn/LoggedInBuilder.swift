//
//  LoggedInBuilder.swift
//  Tutorial
//
//  Created by 김소연 on 11/8/23.
//

import RIBs

protocol LoggedInDependency: Dependency {
    // TODO: Make sure to convert the variable into lower-camelcase.
    var LoggedInViewController: LoggedInViewControllable { get }
    // TODO: Declare the set of dependencies required by this RIB, but won't be
    // created by this RIB.
}

/*
 OffGameBuilder의 계약된 종속성을 만족하기 위해서 LoggedInComponent 클래스를 OffGameComponent를 준수할 수 있게 수정해야 합니다.
 */
final class LoggedInComponent: Component<LoggedInDependency> {

    // TODO: Make sure to convert the variable into lower-camelcase.
    fileprivate var LoggedInViewController: LoggedInViewControllable {
        return dependency.LoggedInViewController
    }

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol LoggedInBuildable: Buildable {
    func build(withListener listener: LoggedInListener) -> LoggedInRouting
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {

    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoggedInListener) -> LoggedInRouting {
        let component = LoggedInComponent(dependency: dependency)
        let interactor = LoggedInInteractor()
        interactor.listener = listener
        
        let offGameBuilder = OffGameBuilder(dependency: component)
        
        return LoggedInRouter(
            interactor: interactor,
            viewController: component.LoggedInViewController,
            offGameBuilder: offGameBuilder
        )
    }
}
