//
//  MainStateAction.swift
//  Image
//
//  Created by 김소연 on 11/13/23.
//

import UIKit

import ReactorKit
import RIBs
import RxSwift

// MARK: - MainPresentableState

struct MainPresentableState {
    var image: UIImage?
}

// MARK: - MainPresentableAction

enum MainPresentableAction {
    case viewWillAppear
}

// MARK: - MainPresentableListener

protocol MainPresentableListener: AnyObject {
    typealias Action = MainPresentableAction
    typealias State = MainPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
    var currentState: State { get }
}
