//
//  LoggedOutViewController.swift
//  Memo
//
//  Created by 김소연 on 11/9/23.
//

import SnapKit
import RIBs
import RxSwift
import RxCocoa
import UIKit

protocol LoggedOutPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func loginDidTap(email: String, password: String)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        rxBind()
    }
    
    // MARK: - Private
    
    private lazy var emailTextField = UITextField()
    private lazy var passwordTextField = UITextField()
    private lazy var loginButton = UIButton()
    
    private let bag = DisposeBag()
    
    private func layout() {
        emailTextField.placeholder = "Enter Your Email"
        passwordTextField.placeholder = "Enter Your Password"
        
        emailTextField.borderStyle = .line
        passwordTextField.borderStyle = .line
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemPink
        loginButton.setTitleColor(.white, for: .normal)
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        emailTextField.snp.makeConstraints {
            $0.top.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(48)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(48)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(48)
        }
    }
    
    private func rxBind() {
        Observable
            .combineLatest(
                emailTextField.rx.text.orEmpty,
                passwordTextField.rx.text.orEmpty
            ) { email, password -> Bool in
                return LoginTextInputManager.isValidEmail(email) && LoginTextInputManager.isValidPassword(password)
            }
            .subscribe(onNext: { [weak self] isValid in
                self?.loginButton.isEnabled = isValid
            })
            .disposed(by: bag)
        
        loginButton
            .rx
            .tap
            .map { [weak self] _ in
                return (self?.emailTextField.text ?? "", self?.passwordTextField.text ?? "")
            }
            .bind(with: self, onNext: { owner, args in
                // View는 UI를 보여주기만 하는 바보로 만들어야 하기 때문에 모든 로직은 Interactor에서 작성합니다.
                let (email, password) = args
                owner.listener?.loginDidTap(email: email, password: password)
            })
            .disposed(by: bag)
    }
    
}
