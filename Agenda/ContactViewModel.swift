//
//  ContactViewModel.swift
//  Agenda
//
//  Created by Jorge Mayta Guillermo on 7/4/20.
//  Copyright © 2020 Cibertec. All rights reserved.
//

import CoreData
import SwiftUI

class ContactViewModel: ObservableObject {
    @Published var contacts = [Contact]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getContacts(){
        let request = Contact.getAllContactRequest()
        do {
            contacts = try context.fetch(request)
        } catch (let error){
            print(error)
        }
    }
       
    func addContact(name: String){
        let contact = Contact(context: context)
        contact.name = name
        saveContext()
    }
    
    func deleteContact(index: Int){
        let contact = contacts[index]
        context.delete(contact)
        saveContext()
    }
    
    func saveContext(){
        if context.hasChanges {
            do{
                try context.save()
                getContacts()
            } catch (let error){
                print(error)
            }
        }
    }
       
}
