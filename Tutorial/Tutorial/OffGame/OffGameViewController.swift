//
//  OffGameViewController.swift
//  Tutorial
//
//  Created by 김소연 on 11/8/23.
//

import RIBs
import RxSwift
import UIKit

protocol OffGamePresentableListener: AnyObject {
    func startTicTacToe()
}

final class OffGameViewController: UIViewController, OffGamePresentable, OffGameViewControllable {
    
    var uiviewController: UIViewController {
        return self
    }

    weak var listener: OffGamePresentableListener?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Method is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.yellow
        buildStartButton()
    }
    
    // MARK: - Private
    
    private func buildStartButton() {
        let startButton = UIButton()
        view.addSubview(startButton)
        startButton.snp.makeConstraints {
            $0.center.equalTo(self.view.snp.center)
            $0.leading.trailing.equalTo(self.view).inset(40)
            $0.height.equalTo(100)
        }
        startButton.setTitle("Start Game", for: .normal)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.backgroundColor = UIColor.black
        startButton.addTarget(self, action: #selector(touchUpStartButton), for: .touchUpInside)
    }
    
    @objc func touchUpStartButton() {
        listener?.startTicTacToe()
    }
    
}
