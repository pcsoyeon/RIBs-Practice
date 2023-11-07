//
//  RootInteractor.swift
//  RIBs-Tutorial
//
//  Created by 김소연 on 11/7/23.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    // RootRIB -> LoggedIn으로 화면전환
    // 이 코드를 통해 RootInteractor와 RootRouter간의 계약 성립
    func routeToLoggedIn(withPlayer1Name player1Name: String, player2Name: String)
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol RootListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {

    weak var router: RootRouting?
    weak var listener: RootListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func didLogin(withPlayer1Name player1Name: String, player2Name: String) {
        router?.routeToLoggedIn(withPlayer1Name: player1Name, player2Name: player2Name)
    }
    
}
