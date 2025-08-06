//
//  CoreDataRelationshipsLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 06.08.2025.
//

import SwiftUI
import CoreData

class CoreDataManeger{
    static let instance = CoreDataManeger()
    
    let container : NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "")
        container.loadPersistentStores { description, error in
            if let error = error{
                print("Error loading core data")
            }
        }
        context = container.viewContext
    }
    
    func save(){
        do{
            try context.save()
        }catch let error{
            print("Error saving core data")
        }
    }
    
}

@Observable class CoreDataRelationshipViewModel{
    
    let manager = CoreDataManeger.instance
    
}

struct CoreDataRelationshipsLearn: View {
    
    @State var vm = CoreDataRelationshipViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CoreDataRelationshipsLearn()
}
