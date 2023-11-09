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
}

final class MemoViewController: UIViewController, MemoPresentable, MemoViewControllable {

    weak var listener: MemoPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        configureTableView()
    }
    
    // MARK: - Private
    
    private lazy var memoTableView = UITableView()
    
    private func layout() {
        view.addSubview(memoTableView)
        
        memoTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func configureTableView() {
        memoTableView.rowHeight = UITableView.automaticDimension
        memoTableView.dataSource = self
        memoTableView.register(MemoListCell.self, forCellReuseIdentifier: "MemoListCell")
    }
    
}

// MARK: - UITableView Delegate, DataSource

extension MemoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemoListCell", for: indexPath) as? MemoListCell else { return UITableViewCell() }
        cell.fetchData(title: "Title")
        return cell
    }
    
}
