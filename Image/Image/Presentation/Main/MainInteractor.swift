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
    func attachDetailRIB()
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
    
    private var repository: MainRepository
    
    // MARK: - Main Reactor
    
    typealias Action = MainPresentableAction
    typealias State = MainPresentableState
    
    var initialState: MainPresentableState
    
    enum Mutation {
        case loadImage(UIImage)
        case attachDetailRIB
    }
    
    // MARK: - Initialize
    
    init(
        presenter: MainPresentable,
        initialState: MainPresentableState,
        repository: MainRepository
    ) {
        self.initialState = initialState
        self.repository = repository
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    // MARK: - MainPresentableListener
    
    func sendAction(_ action: Action) {
        self.action.on(.next(action))
    }
    
}

// MARK: - mutate

extension MainInteractor {
    
    func mutate(action: MainPresentableAction) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear:
            return repository.showImage()
                .map { .loadImage($0) }
        case .didTapDetailButton:
            return Observable.just(.attachDetailRIB)
        }
    }
    
}

// MARK: - reduce

extension MainInteractor {
    
    func reduce(state: MainPresentableState, mutation: Mutation) -> MainPresentableState {
        var newState = state
        switch mutation {
        case .loadImage(let image):
            newState.image = image
        case .attachDetailRIB:
            router?.attachDetailRIB()
        }
        return newState
    }
    
}
