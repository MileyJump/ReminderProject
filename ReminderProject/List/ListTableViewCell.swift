//
//  ListTableViewCell.swift
//  ReminderProject
//
//  Created by 최민경 on 7/5/24.
//

import UIKit

final class ListTableViewCell: BaseTableViewCell {
    
    private let checkImage = UIImageView()
    private let titleLabel = UILabel()
    private let memoLabel = UILabel()
    private let tagLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureHierarchy() {
        contentView.addSubview(checkImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(memoLabel)
        contentView.addSubview(tagLabel)
    }
    
    override func configureLayout() {
        checkImage.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(10)
            make.leading.equalTo(contentView.snp.leading).inset(10)
            make.size.equalTo(22)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(checkImage.snp.top).offset(2)
            make.leading.equalTo(checkImage.snp.trailing).offset(10)
            make.trailing.equalTo(contentView).inset(5)
        }
        
        memoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalTo(titleLabel)
        }
        
        tagLabel.snp.makeConstraints { make in
            make.top.equalTo(memoLabel.snp.bottom).offset(5)
            make.leading.equalTo(titleLabel)
            make.bottom.equalTo(contentView).inset(10)
            
        }
    }
    
    override func configureView() {
        checkImage.image = UIImage(systemName: Resource.ImageCase.unCheckImage.rawValue)
        checkImage.tintColor = .systemGray2
        
        memoLabel.numberOfLines = 0
        memoLabel.font = .systemFont(ofSize: 13)
        memoLabel.textColor = .systemGray2
        
        tagLabel.font = .systemFont(ofSize: 13)
        tagLabel.textColor = .systemBlue
        
        titleLabel.text = "안녕 반가워"
        memoLabel.text = "와 너무 기쁘다 정말 반가워^^ 하하하하하핳 공부옥웁 메모메모 커밋커밋"
        tagLabel.text = "#공부"
        
    }
    
}
