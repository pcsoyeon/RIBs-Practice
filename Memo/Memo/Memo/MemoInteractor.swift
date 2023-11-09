//
//  MemoInteractor.swift
//  Memo
//
//  Created by 김소연 on 11/9/23.
//

import RIBs
import RxSwift

protocol MemoRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol MemoPresentable: Presentable {
    var listener: MemoPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol MemoListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class MemoInteractor: PresentableInteractor<MemoPresentable>, MemoInteractable, MemoPresentableListener {

    weak var router: MemoRouting?
    weak var listener: MemoListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: MemoPresentable) {
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
    
    func changeMemoTitle(_ title: String) {
        print("수정하고 싶은 메모 제목 : \(title)")
    }
    
    // MARK: - Private
    
}
