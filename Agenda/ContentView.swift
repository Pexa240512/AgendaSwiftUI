//
//  ContentView.swift
//  Agenda
//
//  Created by Jorge Mayta Guillermo on 7/4/20.
//  Copyright © 2020 Cibertec. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var textName = ""
    @ObservedObject var contactVM = ContactViewModel()
    
    var body: some View {
        
        List{
            Section(header: Text("Nuevo contacto")){
                HStack{
                    TextField("Ingrese nombre de contacto", text: $textName )
                    Button(action: {
                        if !self.textName.isEmpty {
                            self.contactVM.addContact(name: self.textName)
                            self.textName = ""
                        }
                    }){
                        Image(systemName: "plus")
                    }
                }
            }
            
            Section(header: Text("Contactos")){
                ForEach(self.contactVM.contacts){
                    contact in
                    Text(contact.name!)
                }.onDelete{
                    indexSet in
                    self.contactVM.deleteContact(index: indexSet.first!)
                }
            }
        }.onAppear{
            self.contactVM.getContacts()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
