//
//  MainInteractor.swift
//  Image
//
//  Created by 김소연 on 11/13/23.
//

import UIKit

import ReactorKit
import RIBs
import RxSwift

protocol MainRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol MainPresentable: Presentable {
    var listener: MainPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol MainListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class MainInteractor:
    PresentableInteractor<MainPresentable>,
    MainInteractable,
    MainPresentableListener,
    Reactor
{

    // MARK: - Properties
    
    weak var router: MainRouting?
    weak var listener: MainListener?
    
    // MARK: - Main Reactor

    typealias Action = MainPresentableAction
    typealias State = MainPresentableState
    
    var initialState: MainPresentableState
    
    enum Mutation {
        case loadImage
    }
    
    // MARK: - Initialize
    
    init(
        presenter: MainPresentable,
        initialState: MainPresentableState
    ) {
        self.initialState = initialState
        super.init(presenter: presenter)
        presenter.listener = self
    }

    // MARK: - MainPresentableListener
    
    func sendAction(_ action: Action) {
        switch action {
        case .viewWillAppear:
            print("View Will Appear")
        }
    }
    
}

// MARK: - Load Image

extension MainInteractor {
    
    
}
