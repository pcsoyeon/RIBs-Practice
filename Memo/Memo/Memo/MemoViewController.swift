//
//  MemoViewController.swift
//  Memo
//
//  Created by 김소연 on 11/9/23.
//

import SnapKit
import RIBs
import RxSwift
import UIKit

protocol MemoPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func changeMemoTitle(_ title: String)
}

final class MemoViewController: UIViewController, MemoPresentable, MemoViewControllable {

    weak var listener: MemoPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        configureNavigationBar()
        configureTableView()
    }
    
    // MARK: - Private
    
    // MARK: - Properties
    
    private lazy var memoTitleList: [String] = [
        "RIB",
        "Router",
        "Interactor",
        "Builder"
    ]
    
    // MARK: - Views
    
    private lazy var memoTableView = UITableView()
    
    // MARK: - Helpers
    
    private func layout() {
        view.addSubview(memoTableView)
        
        memoTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func configureTableView() {
        memoTableView.rowHeight = UITableView.automaticDimension
        memoTableView.delegate = self
        memoTableView.dataSource = self
        memoTableView.register(MemoListCell.self, forCellReuseIdentifier: "MemoListCell")
    }
    
    private func configureNavigationBar() {
        self.navigationItem.title = "Memo"
    }
    
}

// MARK: - UITableView Delegate, DataSource

extension MemoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoTitleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemoListCell", for: indexPath) as? MemoListCell else { return UITableViewCell() }
        cell.fetchData(title: memoTitleList[indexPath.row])
        return cell
    }
    
}

extension MemoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listener?.changeMemoTitle(memoTitleList[indexPath.row])
    }
    
}
