//
//  DetailViewController.swift
//  Image
//
//  Created by 김소연 on 11/13/23.
//

import RIBs
import RxSwift
import UIKit

protocol DetailPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class DetailViewController:
    UIViewController,
    DetailPresentable,
    DetailViewControllable
{

    // MARK: - Properties
    
    weak var listener: DetailPresentableListener?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
    
}
