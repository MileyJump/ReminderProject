//
//  ListTableViewCell.swift
//  ReminderProject
//
//  Created by 최민경 on 7/5/24.
//

import UIKit

final class ListTableViewCell: BaseTableViewCell {
    
    let checkButton = UIButton()
    private let priorityLabel = UILabel()
    private let titleLabel = UILabel()
    private let memoLabel = UILabel()
    private let dateLabel = UILabel()
    private let tagLabel = UILabel()
    
    var checkButtonToggle: Bool = false {
        didSet {
            updateCheckButtonImage()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func configureCell(_ data: TodoTable) {
        titleLabel.text = data.todoTitle
        memoLabel.text = data.todoMemo
        checkButtonToggle = data.todoLike
        if let todoDate = data.todoDate {
            dateLabel.text = todoDataformatter(date: todoDate)
        }
        if let tag = data.todoTag {
            if tag != "" {
                tagLabel.text = "#\(tag)"
            }
        }
        
        if let priority = data.todoPriority {
            switch priority {
            case Resource.prioritySegment.height.rawValue:
                priorityLabel.text = "!!!"
                print("어디가 실행되고 있는건가요")
            case Resource.prioritySegment.middle.rawValue:
                priorityLabel.text = "!!"
            case Resource.prioritySegment.lowness.rawValue:
                priorityLabel.text = "!"
            default:
                priorityLabel.text = ""
            }
        }
    }
    
    func updateCheckButtonImage() {
        let imageName = checkButtonToggle ? Resource.ImageCase.checkImage.rawValue : Resource.ImageCase.unCheckImage.rawValue
        checkButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    override func configureHierarchy() {
        contentView.addSubview(checkButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(memoLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(tagLabel)
        contentView.addSubview(priorityLabel)
    }
    
    func todoDataformatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.string(from: date)
    }
    
    override func configureLayout() {
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(10)
            make.leading.equalTo(contentView.snp.leading).inset(10)
            make.size.equalTo(22)
        }
        
        priorityLabel.snp.makeConstraints { make in
            make.top.equalTo(checkButton.snp.top)
            make.leading.equalTo(checkButton.snp.trailing).offset(10)
//            make.width.equalTo() // 글자 크기에 맞게 동적으로 설정
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(checkButton.snp.top)
            make.leading.equalTo(priorityLabel.snp.trailing).offset(2)
            make.trailing.equalTo(contentView).inset(5)
        }
        
        memoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(priorityLabel.snp.leading)
            make.trailing.equalTo(titleLabel.snp.trailing)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(memoLabel.snp.bottom).offset(5)
            make.leading.equalTo(priorityLabel.snp.leading)
            make.bottom.equalTo(contentView).inset(10)
        }
        
        tagLabel.snp.makeConstraints { make in
            make.top.equalTo(memoLabel.snp.bottom).offset(5)
            make.leading.equalTo(dateLabel.snp.trailing).offset(2)
            make.bottom.equalTo(dateLabel)
            
        }
    }
    
    override func configureView() {
//        checkButton.setImage(UIImage(systemName: Resource.ImageCase.unCheckImage.rawValue), for: .normal)
        checkButton.tintColor = .systemGray2
        
        titleLabel.font = .systemFont(ofSize: 15)
        titleLabel.textColor = .white
        
        memoLabel.numberOfLines = 0
        memoLabel.font = .systemFont(ofSize: 13)
        memoLabel.textColor = .systemGray2
        
        dateLabel.font = .systemFont(ofSize: 13)
        dateLabel.textColor = .systemGray2
        tagLabel.font = .systemFont(ofSize: 13)
        tagLabel.textColor = .systemBlue
        
        priorityLabel.font = .systemFont(ofSize: 15)
        priorityLabel.textColor = .systemBlue
        priorityLabel.backgroundColor = .red
    }
    
}
