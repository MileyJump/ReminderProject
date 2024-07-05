//
//  CreateView.swift
//  ReminderProject
//
//  Created by 최민경 on 7/2/24.
//

import UIKit
import SnapKit

class CreateView: BaseView {
    
    let todoTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    override func configureHierarchy() {
        addSubview(todoTableView)
    }
    
    override func configureLayout() {
        todoTableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        todoTableView.layer.cornerRadius = 10
        todoTableView.separatorStyle = .none
    }
}
