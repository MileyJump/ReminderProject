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
    }
}

