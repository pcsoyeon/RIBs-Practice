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
    
    private let player1Name: String
    private let player2Name: String
    
    init(player1Name: String, player2Name: String) {
        self.player1Name = player1Name
        self.player2Name = player2Name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.yellow
        buildStartButton()
        buildPlayerLabels()
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
    
    private func buildPlayerLabels() {
        let labelBuilder: (UIColor, String) -> UILabel = { (color: UIColor, text: String) in
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 35)
            label.backgroundColor = UIColor.clear
            label.textColor = color
            label.textAlignment = .center
            label.text = text
            return label
        }
        
        let player1Label = labelBuilder(UIColor.blue, player1Name)
        view.addSubview(player1Label)
        player1Label.snp.makeConstraints { (maker: ConstraintMaker) in
            maker.top.equalTo(self.view).offset(70)
            maker.leading.trailing.equalTo(self.view).inset(20)
            maker.height.equalTo(40)
        }
        
        let vsLabel = UILabel()
        vsLabel.font = UIFont.systemFont(ofSize: 25)
        vsLabel.backgroundColor = UIColor.clear
        vsLabel.textColor = UIColor.darkGray
        vsLabel.textAlignment = .center
        vsLabel.text = "vs"
        view.addSubview(vsLabel)
        vsLabel.snp.makeConstraints { (maker: ConstraintMaker) in
            maker.top.equalTo(player1Label.snp.bottom).offset(10)
            maker.leading.trailing.equalTo(player1Label)
            maker.height.equalTo(20)
        }
        
        let player2Label = labelBuilder(UIColor.red, player2Name)
        view.addSubview(player2Label)
        player2Label.snp.makeConstraints { (maker: ConstraintMaker) in
            maker.top.equalTo(vsLabel.snp.bottom).offset(10)
            maker.height.leading.trailing.equalTo(player1Label)
        }
    }
    
}
