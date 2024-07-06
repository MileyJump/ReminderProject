//
//  Enum.swift
//  ReminderProject
//
//  Created by 최민경 on 7/3/24.
//

import UIKit

enum Resource {
    
    enum prioritySegment: String {
        case height = "높음"
        case middle = "중간"
        case lowness = "낮음"
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
