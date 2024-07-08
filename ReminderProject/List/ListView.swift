//
//  ListView.swift
//  ReminderProject
//
//  Created by 최민경 on 7/5/24.
//

import UIKit
import SnapKit

class ListView: BaseView {
    
    
    private let titleLabel = {
        let label = UILabel()
        label.text = "전체"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .systemBlue
        return label
    }()
    
    let listTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func configureCell(_ type: TodoType) {
        
    }
    
    override func configureHierarchy() {
        addSubview(titleLabel)
        addSubview(listTableView)
    }
    
    override func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(safeAreaLayoutGuide).inset(10)
        }
        
        listTableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    
    
}
