//
//  CategoryCollectionViewCell.swift
//  ReminderProject
//
//  Created by 최민경 on 7/8/24.
//

import UIKit

final class CategoryCollectionViewCell: BaseCollectionViewCell {
    
    private let iconImageView = UIImageView()
     let titleLabel = UILabel()
     let countLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    override func configureHierarchy() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(countLabel)
    }
    
    override func configureLayout() {
        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.leading.top.equalTo(safeAreaLayoutGuide).offset(8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide).inset(12)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(8)
        }
        
        countLabel.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide).inset(12)
            make.centerY.equalTo(iconImageView.snp.centerY)
        }
    }
    
    override func configureView() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 10
        titleLabel.font = .systemFont(ofSize: 15)
    }
    
    
    
    
}
