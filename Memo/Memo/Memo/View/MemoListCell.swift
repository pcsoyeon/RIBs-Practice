//
//  MemoListCell.swift
//  Memo
//
//  Created by 김소연 on 11/9/23.
//

import UIKit
import SnapKit

final class MemoListCell: UITableViewCell {
    
    // MARK: - Views
    
    private lazy var titleLabel = UILabel()
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func fetchData(title: String) {
        titleLabel.text = title
    }
    
}

// MARK: - ConfigureUI

extension MemoListCell {
    
    private func configureUI() {
        contentView.backgroundColor = .white
        
        titleLabel.textColor = .systemBlue
        titleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().inset(20)
        }
    }
    
}
