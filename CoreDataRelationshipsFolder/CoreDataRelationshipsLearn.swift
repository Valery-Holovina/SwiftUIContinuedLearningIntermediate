//
//  CoreDataRelationshipsLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 06.08.2025.
//

import SwiftUI
import CoreData

// 3 entities
// BusinessEntity
// DepartmentEntity
// EmployEntity

// (relationship To many (can have many employees) , To one (one employee))

class CoreDataManeger{
    static let instance = CoreDataManeger()
    
    let container : NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
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
            print("Saved successfully")
        }catch let error{
            print("Error saving core data")
        }
    }
    
}



@Observable class CoreDataRelationshipViewModel{
    
    let manager = CoreDataManeger.instance
    
    var businesses : [BusinessEntity] = []
    
    
    init() {
        getBusinesses()
    }
    
    func getBusinesses(){
        
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        
        do{
            businesses = try manager.context.fetch(request)
        }catch let error{
            print("eeror fetching")
        }
    }
    
    func addBusiness(){
        
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Apple"
        save()
        
        
    }
    
    func save(){
        manager.save()
        getBusinesses()
    }
    
}




struct CoreDataRelationshipsLearn: View {
    
    @State var vm = CoreDataRelationshipViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 20){
                    Button {
                        vm.addBusiness()
                    } label: {
                        Text("Perform action")
                            .foregroundStyle(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                    .padding()
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top){
                            ForEach(vm.businesses) { business in
                                BusinessView(entity: business)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)

                }
            }
            .navigationTitle("Relationships")
        }
    }
}

#Preview {
    CoreDataRelationshipsLearn()
}

struct BusinessView: View {
    let entity: BusinessEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            
            if let departments = entity.departments?.allObjects as? [DepartmentEntity]{
                Text("Departments: ")
                    .bold()
                ForEach(departments) { department in
                    Text(department.name ?? "")
                }
            }
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity]{
                Text("Employees: ")
                    .bold()
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color(.systemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.secondary, radius: 10)
        .padding()
        
    }
}
