//
//  Translate+CoreDataProperties.swift
//  Translator
//
//  Created by RomanovAI on 04.03.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//
//

import Foundation
import CoreData


extension Translate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Translate> {
        return NSFetchRequest<Translate>(entityName: "Translate")
    }

    @NSManaged public var inputText: String?
    @NSManaged public var outputText: String?

}
