//
//  LoggedOutViewController.swift
//  Memo
//
//  Created by 소연 on 2023/11/09.
//

import SnapKit
import RIBs
import RxSwift
import UIKit

protocol LoggedOutPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func login(email: String)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    // MARK: - Private
    
    private func layout() {
        let emailTextField = UITextField()
        emailTextField.placeholder = "Enter Your Email"
        emailTextField.borderStyle = .roundedRect
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
        
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemPink
        loginButton.setTitleColor(.white, for: .normal)
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints {
            $0.top.equalTo(emailTextField).offset(16)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
    }
    
}
