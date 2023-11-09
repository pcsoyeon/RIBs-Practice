//
//  LoggedInRouter.swift
//  Memo
//
//  Created by 김소연 on 11/9/23.
//

import RIBs
import UIKit

protocol LoggedInInteractable: Interactable, MemoListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(
        interactor: LoggedInInteractable,
        viewController: LoggedInViewControllable,
        memoBuilder: MemoBuildable
    ) {
        self.viewController = viewController
        self.memoBuilder = memoBuilder
        super.init(interactor: interactor)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        routeToMemo()
    }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }

    func routeToMemo() {
        let memoRouting = memoBuilder.build(withListener: interactor)
        self.memoRouting = memoRouting
        attachChild(memoRouting)
        let navigationController = UINavigationController(root: memoRouting.viewControllable)
        viewController.present(viewController: navigationController)
    }
    
    // MARK: - Private

    private let viewController: LoggedInViewControllable
    
    private let memoBuilder: MemoBuildable
    private var memoRouting: ViewableRouting?
}
