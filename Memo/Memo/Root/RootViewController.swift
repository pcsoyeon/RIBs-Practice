//
//  RootViewController.swift
//  Memo
//
//  Created by 소연 on 2023/11/09.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func present(viewController: ViewControllable) {
        let viewController = viewController.uiviewController
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    func dismiss(viewController: ViewControllable) {
        if presentedViewController === viewController.uiviewController {
            dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Private
    
}

// MARK: - LoggedIn

extension RootViewController: LoggedInViewControllable {
    
}
