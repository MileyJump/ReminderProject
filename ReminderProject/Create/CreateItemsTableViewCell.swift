//
//  TodoListTableViewCell.swift
//  ReminderProject
//
//  Created by 최민경 on 7/2/24.
//

import UIKit
import SnapKit

class TodoListTableViewCell: BaseTableViewCell {
  
   
    let titleLabel = UILabel()
    let arrowImage = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowImage)
    }
    
    override func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView.snp.leading).offset(10)
        }
        
        arrowImage.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView.snp.trailing).inset(10)
            make.height.equalTo(20)
        }
    }
    
    override func configureView() {
        arrowImage.backgroundColor = .clear
        arrowImage.tintColor = .lightGray
        
        self.backgroundColor = .darkGray
    }
    
}
