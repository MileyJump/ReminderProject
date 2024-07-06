//
//  PriorityView.swift
//  ReminderProject
//
//  Created by 최민경 on 7/6/24.
//

import UIKit

final class PriorityView: BaseView {
    
    private let titleLabel = UILabel()
    
    private let segmented = {
        let items = ["상", "중", "하"]
        let seg = UISegmentedControl(items: items)
        seg.selectedSegmentIndex = 0
        seg.backgroundColor = .systemGray5
        return seg
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func configureHierarchy() {
        addSubview(titleLabel)
        addSubview(segmented)
    }
    
    override func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
        }
        
        segmented.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
    }
    
    override func configureView() {
        titleLabel.text = "우선 순위를 선택하세요!"
        titleLabel.textAlignment = .center
        
     
    }
    
    
    
}
