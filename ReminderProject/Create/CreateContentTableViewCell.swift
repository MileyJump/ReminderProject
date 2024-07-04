//
//  CreateContentTableViewCell.swift
//  ReminderProject
//
//  Created by 최민경 on 7/3/24.
//

import UIKit
import SnapKit

class CreateContentTableViewCell: BaseTableViewCell {
    private let backGroundView = UIView()
    let titleTextField = UITextField()
    private let lineView = UIView()
    let memoTextView = UITextView()
    
    override func configureHierarchy() {
        contentView.addSubview(backGroundView)
        backGroundView.addSubview(titleTextField)
        backGroundView.addSubview(lineView)
        backGroundView.addSubview(memoTextView)
    }
    
    override func configureLayout() {
        backGroundView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            make.verticalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(8)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(backGroundView).inset(12)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(10)
            make.leading.equalTo(titleTextField.snp.leading)
            make.trailing.equalTo(backGroundView.snp.trailing)
            make.height.equalTo(1)
        }
        
        memoTextView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(titleTextField)
            make.bottom.equalTo(backGroundView.snp.bottom).inset(8)
            make.height.equalTo(95)
        }
    }
    
    override func configureView() {
        super.configureLayout()
        backGroundView.backgroundColor = .systemGray5
        backGroundView.layer.cornerRadius = 10
        
        titleTextField.font = .systemFont(ofSize: 15)
        titleTextField.placeholder = Resource.placeholder.title.rawValue
        
        lineView.backgroundColor = .darkGray.withAlphaComponent(0.5)
        
        memoTextView.text = Resource.placeholder.memo.rawValue
        memoTextView.font = .systemFont(ofSize: 15)
        memoTextView.textColor = .systemGray2
        memoTextView.backgroundColor = .systemGray5
    }
}
