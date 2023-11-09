//
//  MemoBuilder.swift
//  Memo
//
//  Created by 김소연 on 11/9/23.
//

import RIBs

protocol MemoDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class MemoComponent: Component<MemoDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol MemoBuildable: Buildable {
    func build(withListener listener: MemoListener) -> MemoRouting
}

final class MemoBuilder: Builder<MemoDependency>, MemoBuildable {

    override init(dependency: MemoDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: MemoListener) -> MemoRouting {
        let component = MemoComponent(dependency: dependency)
        let viewController = MemoViewController()
        let interactor = MemoInteractor(presenter: viewController)
        interactor.listener = listener
        return MemoRouter(interactor: interactor, viewController: viewController)
    }
}
