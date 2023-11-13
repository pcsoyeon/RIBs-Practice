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
    private lazy var showDetailButton = UIButton()

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

// MARK: - MainViewControllable

extension MainViewController {
    
    func present(viewController: ViewControllable) {
        self.present(viewController.uiviewController, animated: true)
    }
    
}

// MARK: - Binding Actions

extension MainViewController {
    
    private func bindActions() {
        showDetailButton
            .rx
            .tap
            .throttle(.milliseconds(300), latest: false, scheduler: MainScheduler.instance)
            .map { MainPresentableAction.didTapDetailButton }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
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
        
        showDetailButton.setTitle("Show Detail Image", for: .normal)
        showDetailButton.setTitleColor(.systemBlue, for: .normal)
        
        view.addSubview(imageView)
        view.addSubview(showDetailButton)
        
        imageView.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.center.equalToSuperview()
        }
        showDetailButton.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
    }
    
}
