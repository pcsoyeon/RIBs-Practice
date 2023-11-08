//
//  LoggedInRouter.swift
//  Tutorial
//
//  Created by 김소연 on 11/8/23.
//

import RIBs

protocol LoggedInInteractable: Interactable, OffGameListener, TicTacToeListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiess(viewController: ViewControllable)
}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {

    init(
        interactor: LoggedInInteractable,
        viewController: LoggedInViewControllable,
        offGameBuilder: OffGameBuildable,
        ticTacToeBuilder: TicTacToeBuildable
    ) {
        self.viewController = viewController
        self.offGameBuilder = offGameBuilder
        self.ticTacToeBuilder = ticTacToeBuilder
        super.init(interactor: interactor)
        interactor.router = self
    }

    func cleanupViews() {
        if let currentChild = currentChild {
            viewController.dismiess(viewController: currentChild.viewControllable)
        }
    }
    
    override func didLoad() {
        super.didLoad()
        
        attachOffGame()
    }
    
    func routeToTicTacToe() {
        detachTicTacToe()
        attachTicTacToe()
    }

    // MARK: - Private

    private let viewController: LoggedInViewControllable
    
    private let offGameBuilder: OffGameBuildable
    private let ticTacToeBuilder: TicTacToeBuildable
    
    private var currentChild: ViewableRouting?
    
    private func attachOffGame() {
        let offGame = offGameBuilder.build(withListener: interactor)
        self.currentChild = offGame
        attachChild(offGame)
        viewController.present(viewController: offGame.viewControllable)
    }
    
    private func attachTicTacToe() {
        let ticTacToe = ticTacToeBuilder.build(withListener: interactor)
        self.currentChild = ticTacToe
        attachChild(ticTacToe)
        viewController.present(viewController: ticTacToe.viewControllable)
    }
    
    private func detachTicTacToe() {
        if let currentChild = currentChild {
            detachChild(currentChild)
            viewController.dismiess(viewController: currentChild.viewControllable)
            self.currentChild = nil
        }
    }
    
}
