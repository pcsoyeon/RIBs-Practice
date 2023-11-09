//
//  MemoRouter.swift
//  Memo
//
//  Created by 김소연 on 11/9/23.
//

import RIBs

protocol MemoInteractable: Interactable {
    var router: MemoRouting? { get set }
    var listener: MemoListener? { get set }
}

protocol MemoViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class MemoRouter: ViewableRouter<MemoInteractable, MemoViewControllable>, MemoRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: MemoInteractable, viewController: MemoViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
