//
//  TodoTable.swift
//  ReminderProject
//
//  Created by 최민경 on 7/5/24.
//

import Foundation
import RealmSwift

class TodoTable: Object {
    // id = pk
    // - ObjectId : Realm에서 만든 ID 타입
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted(indexed: true) var todoTitle: String
    @Persisted var todoMemo: String?
    @Persisted var todoDate: Date?
    @Persisted var todoPriority: String?
    @Persisted var todoTag: String?
    @Persisted var todoImage: Date?
    @Persisted var todoLike: Bool
    
    convenience init(todoTitle: String, todoMemo: String?, todoDate: Date?, todoPriority: String?, todoTag: String?, todoImage: Date?) {
        self.init()
        self.todoTitle = todoTitle
        self.todoMemo = todoMemo
        self.todoDate = todoDate
        self.todoPriority = todoPriority
        self.todoTag = todoTag
        self.todoImage = todoImage
        self.todoLike = false
    }
}



