//
//  PiriorityViewController.swift
//  ReminderProject
//
//  Created by 최민경 on 7/6/24.
//

import UIKit

final class PriorityViewController: BaseViewController {
    
    let priorityView = PriorityView()
    
    override func loadView() {
        view = priorityView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "", leftTitle: "취소", rightTitle: "저장", leftAction: #selector(cancelButtonTapped), rightAction: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc func saveButtonTapped() {
        print(#function)
        
        guard let selecteSegment = priorityView.segmented.titleForSegment(at: priorityView.segmented.selectedSegmentIndex) else { return }
        NotificationCenter.default.post(name: Notification.Name.priority, object: selecteSegment)
        dismiss(animated: true)
    }
}
