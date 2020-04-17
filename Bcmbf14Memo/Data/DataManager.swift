//
//  DataManager.swift
//  Bcmbf14Memo
//
//  Created by jongchankim on 2020/04/17.
//  Copyright © 2020 jongchankim. All rights reserved.
//

import Foundation
import CoreData


class DataManager {
    
    static let shared = DataManager()
    private init(){
        
    }
    
    var mainContext : NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    
    var memoList = [Memo]()
    
    func fetchMemo() {
        let request: NSFetchRequest<Memo> = Memo.fetchRequest()
        
        
        let sortByDateDesc = NSSortDescriptor(key: "insertDate", ascending: false)
        request.sortDescriptors = [sortByDateDesc]
        
        do {
            memoList = try mainContext.fetch(request)
        }catch {
            print(error)
        }
    }
    
    
    func addNewMemo(_ memo: String?){
        let newMemo = Memo(context: mainContext)
        newMemo.content = memo
        newMemo.insertDate = Date()
        
        
//        메모를 등록하고 다시 테이블뷰가 로드되는 과정에서 fetchMemo를 호출하는 방법도 있지만,
//        그것보다는 이렇게 배열에 추가해주는 것이 더 효율적이다. 날짜최신순이므로 append 대신 insert를 활용한다.
        memoList.insert(newMemo, at: 0)
        
        saveContext()
    }
    
    
    
    // MARK: - Core Data stack

     lazy var persistentContainer: NSPersistentContainer = {
      
         let container = NSPersistentContainer(name: "Bcmbf14Memo")
         container.loadPersistentStores(completionHandler: { (storeDescription, error) in
             if let error = error as NSError? {
       
                 fatalError("Unresolved error \(error), \(error.userInfo)")
             }
         })
         return container
     }()

     // MARK: - Core Data Saving support

     func saveContext () {
         let context = persistentContainer.viewContext
         if context.hasChanges {
             do {
                 try context.save()
             } catch {
                 // Replace this implementation with code to handle the error appropriately.
                 // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 let nserror = error as NSError
                 fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
             }
         }
     }
    
}
