//
//  OffGameViewController.swift
//  RIBs-Tutorial
//
//  Created by 김소연 on 11/7/23.
//

import UIKit

import RIBs
import RxSwift
import SnapKit

protocol OffGamePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class OffGameViewController: UIViewController, OffGamePresentable, OffGameViewControllable {

    var uiviewController: UIViewController {
        return self
    }
    
    weak var listener: OffGamePresentableListener?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        startButton.setTitleColor(.white, for: .normal)
        startButton.backgroundColor = .black
    }
    
}
