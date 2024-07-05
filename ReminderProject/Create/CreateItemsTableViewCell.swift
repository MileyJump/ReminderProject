//
//  TodoListTableViewCell.swift
//  ReminderProject
//
//  Created by 최민경 on 7/2/24.
//

import UIKit
import SnapKit

class TodoListTableViewCell: BaseTableViewCell {
    
    let bgView = UIView()
    let titleLabel = UILabel()
    let chevronImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureHierarchy() {
        contentView.addSubview(bgView)
        bgView.addSubview(titleLabel)
        bgView.addSubview(chevronImage)
    }
    
    func configureCell(_ data: AddType ) {
        titleLabel.text = data.rawValue
    }
    
    override func configureLayout() {
        bgView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(50)
            make.verticalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(bgView)
            make.leading.equalTo(bgView.snp.leading).offset(10)
        }
        
        chevronImage.snp.makeConstraints { make in
            make.centerY.equalTo(bgView)
            make.trailing.equalTo(bgView.snp.trailing).inset(10)
            make.height.equalTo(20)
        }
    }
    
    override func configureView() {
        bgView.backgroundColor = .systemGray5
        bgView.layer.cornerRadius = 10
        
        chevronImage.image = UIImage(systemName: Resource.ImageCase.chevronImage.rawValue)
        chevronImage.tintColor = .systemGray2
        
        titleLabel.font = .systemFont(ofSize: 13)
    }
    
}
