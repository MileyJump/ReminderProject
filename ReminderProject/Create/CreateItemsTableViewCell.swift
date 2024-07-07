//
//  TodoListTableViewCell.swift
//  ReminderProject
//
//  Created by 최민경 on 7/2/24.
//

import UIKit
import SnapKit

final class CreateItemsTableViewCell: BaseTableViewCell {
    
    private let bgView = UIView()
    private let titleLabel = UILabel()
    private let chevronImage = UIImageView()
    private let itemLabel = UILabel()
    private let thumbnailImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureHierarchy() {
        contentView.addSubview(bgView)
        bgView.addSubview(titleLabel)
        bgView.addSubview(chevronImage)
        bgView.addSubview(itemLabel)
        bgView.addSubview(thumbnailImage)
    }
    
    override func prepareForReuse() {
        itemLabel.text = ""
        thumbnailImage.image = nil
    }
    
    func configureCell(_ type: AddType, data: TodoTable, image: UIImage? ) {
        titleLabel.text = type.rawValue

        switch type {
        case .deadline :
            if let date = data.todoDate {
                itemLabel.text = formatter(date: date)
            }
        case .priority:
            itemLabel.text = data.todoPriority
        case .tag:
            itemLabel.text = data.todoTag
        case .addImage:
            thumbnailImage.image = loadImageToDocument(filename: "\(data.id)")
        }
    }
    
    func formatter(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        let dateString = formatter.string(from: date)
        return dateString
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
        
        itemLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(chevronImage.snp.leading).inset(-10)
        }
        
        thumbnailImage.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.verticalEdges.equalTo(bgView).inset(5)
            make.width.equalTo(thumbnailImage.snp.height)
            make.trailing.equalTo(chevronImage.snp.leading).inset(-10)
        }
        
    }
    
    override func configureView() {
        bgView.backgroundColor = .systemGray5
        bgView.layer.cornerRadius = 10
        
        chevronImage.image = UIImage(systemName: Resource.ImageCase.chevronImage.rawValue)
        chevronImage.tintColor = .systemGray2
        
        titleLabel.font = .systemFont(ofSize: 13)
        
        itemLabel.font = .systemFont(ofSize: 13)
        
        thumbnailImage.layer.cornerRadius = 10
    }
    
}
