//
//  LoggedOutInteractor.swift
//  RIBs-Tutorial
//
//  Created by 김소연 on 11/7/23.
//

import RIBs
import RxSwift

protocol LoggedOutRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol LoggedOutPresentable: Presentable {
    var listener: LoggedOutPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol LoggedOutListener: AnyObject {
    /*
     LoggedOutRIB -> RootRIB 소통
     - RootRIB이 LoggedOutRIB의 상위 RIB이므로
     - RootRouter는 LoggedOutInteractor의 Listener
     - 이 Listener를 통해 로그인 이벤트를 LoggedOutRIB -> RootRIB으로 전달
    */
    func didLogin(withPlayer1Name player1Name: String, player2Name: String)
}

final class LoggedOutInteractor: PresentableInteractor<LoggedOutPresentable>, LoggedOutInteractable, LoggedOutPresentableListener {

    weak var router: LoggedOutRouting?
    weak var listener: LoggedOutListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: LoggedOutPresentable) {
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
    
    func login(withPlayer1Name player1Name: String?, player2Name: String?) {
        let player1NameWithDefault = playerName(player1Name, withDefaultName: "Player 1")
        let player2NameWithDefault = playerName(player2Name, withDefaultName: "Player 2")
        
        // LoggedOutListener 작성 후
        // 리스너를 만들었으니, LoggedOutRIB에서 login 액션이 발동했을 때 리스너를 호출함으로써 상위 RIB에게 알려줍니다.
        // LoggedOutRIB 리스너는 사용자가 'Login' 버튼을 탭하면 호출됩니다. 
        listener?.didLogin(withPlayer1Name: player1NameWithDefault, player2Name: player2NameWithDefault)
    }
    
    private func playerName(_ name: String?, withDefaultName defaultName: String) -> String {
        if let name = name {
            return name.isEmpty ? defaultName : name
        } else {
            return defaultName
        }
    }
    
}
