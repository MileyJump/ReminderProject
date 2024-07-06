//
//  DeadlineViewController.swift
//  ReminderProject
//
//  Created by 최민경 on 7/5/24.
//

import UIKit

final class DeadlineViewController: BaseViewController {
    
    private let deadlineView = DeadlineView()
    
    override func loadView() {
        view = deadlineView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "마감일 등록", leftTitle: "취소", rightTitle: "저장", leftAction: #selector(cancelButtonTapped), rightAction: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem?.isEnabled = true
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

