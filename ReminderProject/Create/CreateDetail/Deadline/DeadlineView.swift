//
//  deadlineView.swift
//  ReminderProject
//
//  Created by 최민경 on 7/5/24.
//

import UIKit
import SnapKit

final class DeadlineView: BaseView {
    
    private let datePicker = UIDatePicker()
    
    override func configureHierarchy() {
        addSubview(datePicker)
    }
    
    override func configureLayout() {
        datePicker.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.centerY.equalTo(safeAreaLayoutGuide).offset(-50)
        }
    }
    
    override func configureView() {
        backgroundColor = .systemBackground
        
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko-KR")
        
    }
}



