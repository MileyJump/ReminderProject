//
//  addImageView.swift
//  ReminderProject
//
//  Created by 최민경 on 7/6/24.
//

import UIKit

final class AddImageView: BaseView {
    
    let todoImageView = UIImageView()
    let explainLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func configureHierarchy() {
        addSubview(todoImageView)
        addSubview(explainLabel)
    }
    
    override func configureLayout() {
        todoImageView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.centerX.equalTo(self)
            make.height.equalTo(self.snp.width)
        }
        
        explainLabel.snp.makeConstraints { make in
            make.center.horizontalEdges.equalTo(todoImageView)
        }
    }
    
    override func configureView() {
        todoImageView.backgroundColor = .systemGray5
        
        explainLabel.text = "이 곳을 클릭하여 사진을 업로드 하세요!"
        explainLabel.textAlignment = .center
        explainLabel.font = .boldSystemFont(ofSize: 16)
        
    }
    
}
