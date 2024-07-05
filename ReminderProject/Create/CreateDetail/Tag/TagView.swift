//
//  TagView.swift
//  ReminderProject
//
//  Created by 최민경 on 7/5/24.
//

import UIKit

final class TagView: BaseView {
    
    let tagTextField = UITextField()
    
    override func configureHierarchy() {
        addSubview(tagTextField)
    }
    
    override func configureLayout() {
        tagTextField.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(safeAreaLayoutGuide).offset(100)
            make.height.equalTo(40)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }
    
    override func configureView() {
        tagTextField.backgroundColor = .systemGray5
        tagTextField.placeholder = "나만의 'Tag'를 입력하세요!"
        tagTextField.textAlignment = .center
        tagTextField.layer.cornerRadius = 10
    }
    
    
}
