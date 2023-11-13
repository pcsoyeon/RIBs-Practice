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
import RxCocoa
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
    
    private let actionRelay = PublishSubject<MainPresentableListener.Action>()
    private let disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        actionRelay.onNext(.viewWillAppear)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        bind(listener: listener)
    }
    
    private func bind(listener: MainPresentableListener?) {
        guard let listener = listener else { return }
        bindActionRelay()
        bindActions()
        bindState(listener: listener)
    }
    
    private func bindActionRelay() {
        self.actionRelay.asObservable()
            .subscribe(with: self) { owner, action in
                owner.listener?.sendAction(action)
            }
            .disposed(by: disposeBag)
    }
    
}

// MARK: - Binding Actions

extension MainViewController {
    
    private func bindActions() {
        
    }
    
}

// MARK: - Binding State

extension MainViewController {
    
    private func bindState(listener: MainPresentableListener) {
        listener.state
            .map { $0.image }
            .bind(to: self.imageView.rx.image)
            .disposed(by: disposeBag)
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
