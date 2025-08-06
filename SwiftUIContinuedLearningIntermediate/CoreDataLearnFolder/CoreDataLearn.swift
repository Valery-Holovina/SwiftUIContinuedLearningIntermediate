//
//  CoreData.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 05.08.2025.
//

import SwiftUI
import CoreData

@Observable class CoreDataViewModel{
    
    let container: NSPersistentContainer
    var savedEntities : [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "CoreDataFruitsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading core data")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits(){
        
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do{
            savedEntities = try container.viewContext.fetch(request)
        }catch let error{
            print("error fetching")
        }
        
    }
    
    func addFruit(text: String){
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    func updateFruit(entity: FruitEntity){
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        saveData()
    }
    
    func deleteFruit(indexSet: IndexSet){
        guard let index = indexSet.first else{return}
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    

    
    
    func saveData(){
        
        do{
            try container.viewContext.save()
            fetchFruits()
        }catch let error{
            print("error saving")
        }
    }
    
    
    
}

struct CoreDataLearn: View {
    
    @State var vm = CoreDataViewModel()
    
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                TextField("Add fruit here...", text: $textFieldText)
                    .font(.headline)
                    .padding()
                    .frame(height: 55)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                
                Button {
                    guard !textFieldText.isEmpty else{return}
                    vm.addFruit(text: textFieldText)
                    textFieldText = ""
                } label: {
                    Text("Button")
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemPink))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                    
                }
                List{
                    ForEach(vm.savedEntities) { entity in
                        Text(entity.name ?? "No name")
                            .onTapGesture {
                                vm.updateFruit(entity: entity)
                            }
                    }
                    .onDelete (perform: vm.deleteFruit)
                    
                }
                .navigationTitle("Fruits")
            }
        }
    }
}
#Preview {
    CoreDataLearn()
}
