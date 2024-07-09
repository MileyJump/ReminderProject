//
//  DeadlineViewController.swift
//  ReminderProject
//
//  Created by 최민경 on 7/5/24.
//

import UIKit

final class DeadlineViewController: BaseViewController {
    
    private let deadlineView = DeadlineView()
    
    let viewModel = DeadlineViewModel()
    
    override func loadView() {
        view = deadlineView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "마감일 등록", leftTitle: "취소", rightTitle: "저장", leftAction: #selector(cancelButtonTapped), rightAction: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem?.isEnabled = true
        
        deadlineView.datePicker.addTarget(self, action: #selector(datePickervalueChangede), for: .valueChanged)
        
        bindDate()
    }
    
    func bindDate() {
        viewModel.outputValidationText.bind { value in
            self.deadlineView.dateLabel.text = value
        }
    }
    
    @objc func datePickervalueChangede() {
        let date = deadlineView.datePicker.date
        viewModel.inputDate.value = "\(date)"
//        deadlineView.dateLabel.text = "\(date)"
        print("\(date)")
    }
    
    @objc func cancelButtonTapped() {
        print(#function)
        dismiss(animated: true)
    }
    
    @objc func saveButtonTapped() {
        print(#function)
        let date = deadlineView.datePicker.date
        
        NotificationCenter.default.post(name: Notification.Name.deadline, object: date)
        dismiss(animated: true)
    }
}

