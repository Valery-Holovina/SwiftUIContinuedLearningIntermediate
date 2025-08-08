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
    var departments: [DepartmentEntity] = []
    
    
    init() {
        getBusinesses()
        getDepartments()
    }
    
    func getBusinesses(){
        
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        
        do{
            businesses = try manager.context.fetch(request)
        }catch let error{
            print("eeror fetching")
        }
    }
    
    func getDepartments(){
        
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        
        do{
            departments = try manager.context.fetch(request)
        }catch let error{
            print("eeror fetching")
        }
    }

    
    
    func addBusiness(){
        
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Apple"
        save()
        
        
        // add existing departments to the new business
        //newBusiness.departments = []
        
        // add existing employees to the new business
        //newBusiness.employees = []
        
        
        //add new bussines to existing department
        //newBusiness.addToDepartments(<#T##value: DepartmentEntity##DepartmentEntity#>)
        
        
        //add new business to existing employee
//        newBusiness.addToEmployees(<#T##value: EmployeeEntity##EmployeeEntity#>)
        
        
        
        
    }
    
    func addDepartment(){
        let newDepartment = DepartmentEntity(context: manager.context)
        newDepartment.name = "Marketing"
        newDepartment.businesses = [businesses[0]]
        save()
    }
    
    func save(){
        businesses.removeAll()
        departments.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1){ [self] in
            self.manager.save()
            self.getBusinesses()
            self.getDepartments()
        }
        
      
    }
    
}




struct CoreDataRelationshipsLearn: View {
    
    @State var vm = CoreDataRelationshipViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 20){
                    Button {
                        vm.addDepartment()
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
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top){
                            ForEach(vm.departments) { department in
                                DepartmentView(entity: department)
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


struct DepartmentView: View {
    let entity: DepartmentEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            
            if let businesses = entity.businesses?.allObjects as? [BusinessEntity]{
                Text("Businesses: ")
                    .bold()
                ForEach(businesses) { business in
                    Text(business.name ?? "")
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
        .background(Color(.green))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.secondary, radius: 10)
        .padding()
        
    }
}
