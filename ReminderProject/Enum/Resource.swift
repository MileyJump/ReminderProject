//
//  Enum.swift
//  ReminderProject
//
//  Created by 최민경 on 7/3/24.
//

import UIKit

enum Resource {
    
    enum Todo: String, CaseIterable {
        case deadline = "마감일"
        case tag = "태그"
        case priority = "우선 순위"
        case addImage = "이미지 추가"
    }
    
    enum placeholder: String {
        case title = "제목"
        case memo = "메모"
    }
     
    enum ImageCase: String {
        case addImage = "plus.circle.fill"
        case chevronImage = "chevron.right"
        case unCheckImage = "circle"
        case checkImage = "checkmark.circle.fill"
        case moreImage = "ellipsis.circle"
    }
    
 
}
