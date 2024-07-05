//
//  TodoType.swift
//  ReminderProject
//
//  Created by 최민경 on 7/3/24.
//

import UIKit

enum AddType: String, CaseIterable {
    case deadline = "마감일"
    case tag = "태그"
    case priority = "우선 순위"
    case addImage = "이미지 추가"
}


enum TodoType: String, CaseIterable {
    case today
    case schedule
    case all
    case flag
    case finish
    
    var title: String {
        switch self {
        case .today:
            "오늘"
        case .schedule:
            "예정"
        case .all:
            "전체"
        case .flag:
            "깃발표시"
        case .finish:
            "완료됨"
        }
    }
    
    var imageName: String {
        switch self {
        case .today:
            return "sun.max.circle.fill"
        case .schedule:
            return "calendar.circle.fill"
        case .all:
            return "tray.circle.fill"
        case .flag:
            return "flag.circle.fill"
        case .finish:
            return "checkmark.circle.fill"
        }
    }
    
    var imageColor: UIColor {
        switch self {
        case .today:
            return .systemBlue
        case .schedule:
            return .systemRed
        case .all:
            return .darkGray
        case .flag:
            return .systemYellow
        case .finish:
            return .lightGray
        }
    }
}

