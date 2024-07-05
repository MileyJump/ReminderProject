//
//  BaseView.swift
//  ReminderProject
//
//  Created by 최민경 on 7/2/24.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    @available(* , unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        print(#function)
    }
    
    func configureView() {
        print(#function)
    }
    
    func configureLayout() {
        print(#function)
    }
    
}
