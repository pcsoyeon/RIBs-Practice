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
    /// viewWillAppear 이후 화면에 보여질 image
    var image: UIImage?
}

// MARK: - MainPresentableAction

enum MainPresentableAction {
    /// 메인 화면 진입 (viewWillAppear)
    case viewWillAppear
    /// 상세 화면 버튼
    case didTapDetailButton
}

// MARK: - MainPresentableListener

protocol MainPresentableListener: AnyObject {
    typealias Action = MainPresentableAction
    typealias State = MainPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
    var currentState: State { get }
}
