//
//  Contact.swift
//  Agenda
//
//  Created by Jorge Mayta Guillermo on 7/4/20.
//  Copyright © 2020 Cibertec. All rights reserved.
//

import CoreData

class Contact: NSManagedObject, Identifiable {
    @NSManaged var name: String?
    
    
    static func getAllContactRequest() -> NSFetchRequest<Contact> {
        let request = Contact.fetchRequest() as! NSFetchRequest<Contact>
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        return request
    }
}
