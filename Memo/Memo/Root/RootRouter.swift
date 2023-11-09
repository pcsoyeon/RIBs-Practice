//
//  RootRouter.swift
//  Memo
//
//  Created by 소연 on 2023/11/09.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener, LoggedInListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(
        interactor: RootInteractable,
        viewController: RootViewControllable,
        loggedOutBuilder: LoggedOutBuildable,
        loggedInBuilder: LoggedInBuildable
    ) {
        self.loggedOutBuilder = loggedOutBuilder
        self.loggedInBuilder = loggedInBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        routeToLoggedOut()
    }
    
    /*
     RootRouting 프로토콜을 RootRouter가 따르고 있기 때문에 여기서 routeToLoggedOut 함수를 구현해야 합니다.
     */
    func routeToLoggedOut() {
        // 1. RIB 연결
        // builder를 통해 RIB을 생성합니다.
        // withListener는 LoggedOutListener 프로토콜 타입입니다. (LoggedOut에서 부모RIB인 RootRIB에게 전달할 내용이 있을 수 있기 때문입니다.)
        // LoggedOutRIB을 듣고 있는 역할로 RootRIB의 interactor를 넣어줍니다. 그러기 위해서는 RootInteractable 프로토콜이 LoggedOutListener 프로토콜을 채택하고 있어야 합니다.
        let loggedOutRouting = loggedOutBuilder.build(withListener: interactor)
        
        // 객체 생성해서 넣어주기 
        self.loggedOutRouting = loggedOutRouting
        // attach
        attachChild(loggedOutRouting)
        
        // 2. RIB의 화면 전환 (present)
        viewController.present(viewController: loggedOutRouting.viewControllable)
    }
    
    func routeToLoggedIn(email: String, password: String) {
        if let loggedOutRouting = loggedOutRouting {
            // 1. RIB detach
            detachChild(loggedOutRouting)
            // 2. 화면에서 사라지도록
            viewController.dismiss(viewController: loggedOutRouting.viewControllable)
            // 3. nil로
            self.loggedOutRouting = nil
        }
        let loggedInRouting = loggedInBuilder.build(withListener: interactor)
        attachChild(loggedInRouting)
    }
    
    // MARK: - Private
    
    private let loggedOutBuilder: LoggedOutBuildable
    private var loggedOutRouting: ViewableRouting?
    
    private let loggedInBuilder: LoggedInBuildable
}
