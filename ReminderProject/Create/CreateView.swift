//
//  CreateView.swift
//  ReminderProject
//
//  Created by 최민경 on 7/2/24.
//

import UIKit
import SnapKit

class CreateView: BaseView {
    
    let createView = UIView()
    let lineView = UIView()
    
    let titleTextField = UITextField()
    let memoTextView = UITextView()
    let todoTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override func configureHierarchy() {
        addSubview(createView)
        addSubview(titleTextField)
        addSubview(memoTextView)
        addSubview(todoTableView)
        addSubview(lineView)
        addSubview(todoTableView)
        
    }
    
    override func configureLayout() {
        createView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(150)
        }
       
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(createView.snp.top).inset(10)
            make.horizontalEdges.equalTo(createView.snp.horizontalEdges).inset(10)
            make.height.equalTo(40)
        }
        
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom)
            make.height.equalTo(1)
            make.horizontalEdges.equalTo(createView)
        }
        
        memoTextView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom)
            make.bottom.horizontalEdges.equalTo(createView).inset(10)
        }
        
        todoTableView.snp.makeConstraints { make in
            make.top.equalTo(createView.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(createView.snp.horizontalEdges)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        createView.backgroundColor = .darkGray
        createView.layer.cornerRadius = 10
        lineView.backgroundColor = .lightGray
        
        titleTextField.backgroundColor = .darkGray
        memoTextView.backgroundColor = .darkGray
        titleTextField.placeholder = "제목"
        
        todoTableView.layer.cornerRadius = 10
        todoTableView.backgroundColor = .clear
    }
}
