//
//  TicTacToeRouter.swift
//  RIBs-Tutorial
//
//  Created by 김소연 on 11/7/23.
//

import RIBs

protocol TicTacToeInteractable: Interactable {
    var router: TicTacToeRouting? { get set }
    var listener: TicTacToeListener? { get set }
}

protocol TicTacToeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class TicTacToeRouter: ViewableRouter<TicTacToeInteractable, TicTacToeViewControllable>, TicTacToeRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: TicTacToeInteractable, viewController: TicTacToeViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
