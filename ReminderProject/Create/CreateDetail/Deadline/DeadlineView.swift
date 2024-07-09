//
//  deadlineView.swift
//  ReminderProject
//
//  Created by 최민경 on 7/5/24.
//

import UIKit
import SnapKit

final class DeadlineView: BaseView {
    
    let dateLabel = UILabel()
    
     let datePicker = UIDatePicker()
    
    override func configureHierarchy() {
        addSubview(datePicker)
        addSubview(dateLabel)
    }
    
    override func configureLayout() {
        datePicker.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(safeAreaLayoutGuide).offset(100)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(50)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(30)
        }
        
    }
    
    override func configureView() {
        backgroundColor = .systemBackground
        
        dateLabel.backgroundColor = .white
        dateLabel.textColor = .black
        
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko-KR")
        
    }
}



