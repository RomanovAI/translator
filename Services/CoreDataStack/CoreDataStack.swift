//
//  CoreDataStack.swift
//  Translator
//
//  Created by RomanovAI on 03.03.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Translator")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        let context = persistentContainer.viewContext
        return context
    }()
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveInCoreData(inputText: String?, outputText: String?) {
        let translate = Translate(context: context)
        translate.inputText = inputText
        translate.outputText = outputText
        
        do {
            try context.save()
        } catch let error as NSError {
            print("error.localizedDescription==", error.localizedDescription)
        }
    }
    
    func fetchInCoreData() -> [Translate] {
        let fetchRequest: NSFetchRequest<Translate> = Translate.fetchRequest()
        var translatedText: [Translate] = []
        
        do {
            translatedText = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return translatedText
    }
    
    func removeAll() {
        let fetchRequest: NSFetchRequest<Translate> = Translate.fetchRequest()
        
        do {
            let objects = try context.fetch(fetchRequest)
            for object in objects {
                context.delete(object)
            }
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
    
    func remove(text: Translate) {
        let fetchRequest: NSFetchRequest<Translate> = Translate.fetchRequest()
        guard let inputText = text.inputText else { return }
        fetchRequest.predicate = NSPredicate(format: "inputText == %@", inputText)
        
        do {
            let objects = try context.fetch(fetchRequest)
            if let object = objects.first {
                context.delete(object)
                try context.save()
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
}
