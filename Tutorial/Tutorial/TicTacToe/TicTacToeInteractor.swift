//
//  TicTacToeInteractor.swift
//  Tutorial
//
//  Created by 김소연 on 11/8/23.
//

import RIBs
import RxSwift

protocol TicTacToeRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol TicTacToePresentable: Presentable {
    var listener: TicTacToePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol TicTacToeListener: AnyObject {
    func gameDidEnd()
}

final class TicTacToeInteractor: PresentableInteractor<TicTacToePresentable>, TicTacToeInteractable, TicTacToePresentableListener {

    weak var router: TicTacToeRouting?
    weak var listener: TicTacToeListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: TicTacToePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        initBoard()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    // MARK: - TicTacToe PresentableListener
    
    func placeCurrentPlayerMark(atRow row: Int, col: Int) {
        
    }
    
    func closeGame() {
        
    }
    
    // MARK: - Private
    
    private var currentPlayer = PlayerType.red
    private var board = [[PlayerType?]]()
    
    private func initBoard() {
        for _ in 0..<GameConstants.rowCount {
            board.append([nil, nil, nil])
        }
    }
    
}

// MARK: - Enums

enum PlayerType: Int {
    case red = 1
    case blue
}

struct GameConstants {
    static let rowCount = 3
    static let colCount = 3
}
