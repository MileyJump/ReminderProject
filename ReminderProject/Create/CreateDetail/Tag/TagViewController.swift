//
//  TagViewController.swift
//  ReminderProject
//
//  Created by 최민경 on 7/5/24.
//

import UIKit

final class TagViewController: BaseViewController {
    let tagView = TagView()
    
    override func loadView() {
        view = tagView
    }
    
    
}

