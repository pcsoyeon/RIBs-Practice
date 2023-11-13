//
//  MainViewController.swift
//  Image
//
//  Created by 김소연 on 11/13/23.
//

import UIKit

import ReactorKit
import RIBs
import RxSwift
import SnapKit

final class MainViewController:
    UIViewController,
    MainPresentable,
    MainViewControllable
{
    
    // MARK: - Views
    
    private lazy var imageView = UIImageView()

    // MARK: - Properties
    
    weak var listener: MainPresentableListener?
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listener?.sendAction(.viewWillAppear)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
}

// MARK: - ConfigureUI

extension MainViewController {
    
    private func configureUI() {
        view.backgroundColor = .white
        imageView.backgroundColor = .systemGray6
        
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.center.equalToSuperview()
        }
    }
    
}
