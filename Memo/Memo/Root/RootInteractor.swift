//
//  RootInteractor.swift
//  Memo
//
//  Created by 소연 on 2023/11/09.
//

import RIBs
import RxSwift

/*
 - LoggedOutRIB을 build 및 attach 하는 책임은 RootRouter에게 있습니다.
 (Router는 단순히 그 명령을 받아서 attach, detach 담당입니다.)
 - Router에게 앱이 실행되면 바로 LoggedOutRIB을 연결하라고 명령을 내리기 위해 Interactor로 이동합니다.
 */
protocol RootRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routeToLoggedOut()
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol RootListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {

    // Interactor는 아래와 같이 router를 갖고 있습니다.
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
}
