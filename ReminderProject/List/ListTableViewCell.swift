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
    private let dateLabel = UILabel()
    private let tagLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func configureCell(_ data: TodoTable) {
        titleLabel.text = data.todoTitle
        memoLabel.text = data.todoMemo
        if let todoDate = data.todoDate {
            dateLabel.text = todoDataformatter(date: todoDate)
        }
        if let tag = data.todoTag {
            tagLabel.text = "#\(tag)"
        }
    }
    
    override func configureHierarchy() {
        contentView.addSubview(checkImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(memoLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(tagLabel)
    }
    
    func todoDataformatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.string(from: date)
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
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(memoLabel.snp.bottom).offset(5)
            make.leading.equalTo(titleLabel)
            make.bottom.equalTo(contentView).inset(10)
        }
        
        tagLabel.snp.makeConstraints { make in
            make.top.equalTo(memoLabel.snp.bottom).offset(5)
            make.leading.equalTo(dateLabel.snp.trailing).offset(2)
            make.bottom.equalTo(dateLabel)
            
        }
    }
    
    override func configureView() {
        checkImage.image = UIImage(systemName: Resource.ImageCase.unCheckImage.rawValue)
        checkImage.tintColor = .systemGray2
        
        titleLabel.font = .systemFont(ofSize: 15)
        titleLabel.textColor = .white
        
        memoLabel.numberOfLines = 0
        memoLabel.font = .systemFont(ofSize: 13)
        memoLabel.textColor = .systemGray2
        
        dateLabel.font = .systemFont(ofSize: 13)
        dateLabel.textColor = .systemGray2
        tagLabel.font = .systemFont(ofSize: 13)
        tagLabel.textColor = .systemBlue
        
//        tagLabel.text = "#공부"
        
    }
    
}
