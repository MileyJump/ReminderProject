//
//  TodoTableRepository.swift
//  ReminderProject
//
//  Created by 최민경 on 7/5/24.
//

import Foundation
import RealmSwift

final class TodoTableRepository {
    
    // Realm 위치 찾기
    private let realm = try! Realm()
    
    // Realm 가져오기
    func fetchAll() -> [TodoTable] {
        let todoList = realm.objects(TodoTable.self)
        return Array(todoList)
    }
    
    // Realm 추가하기
    func createItem(_ data: TodoTable) {
        do {
            try realm.write {
                realm.add(data)
                print("Realm Create Succeed")
            }
        } catch {
            print("Realm Error")
        }
    }
    
}
