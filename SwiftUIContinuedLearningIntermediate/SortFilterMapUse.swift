//
//  SortFilterMapUse.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 03.08.2025.
//

import SwiftUI

struct UserModel: Identifiable{
    let id = UUID().uuidString
    let name : String
    let points : Int
    let isVerified: Bool
}

// ViewModel

@Observable class ArrayModificationViewModel{
    
    var dataArray: [UserModel] = []
    var filteredArray: [UserModel] = []
    
    init(){
        getUsers()
        updatedFilteredArray()
    }
    
    func updatedFilteredArray(){
        
        //sort
        //filter
        //map
        
        
        // MARK: Sort
//        // Version 1
//        //user1 and user2 just random name not from dataArray
//        filteredArray = dataArray.sorted { user1, user2 in
//            return user1.points > user2.points
//        }
        
        // Version 2 Shorter
//        filteredArray = dataArray.sorted(by: {$0.points > $1.points})
        
        
        //MARK: Filter
        
        //Version 1
//        filteredArray = dataArray.filter({ user in
////            return user.isVerified
//            return user.name.contains("C")
//        })
        
        // Version 2 Shorter
        filteredArray = dataArray.filter({$0.isVerified})
    
        
    }
    
    
    
    // command + option + left arrow (to fold)
    func getUsers(){
        let user1 = UserModel(name: "Jude", points: 5, isVerified: true)
        let user2 = UserModel(name: "Aaron", points: 900, isVerified: true)
        let user3 = UserModel(name: "Cardan", points: 50, isVerified: true)
        let user4 = UserModel(name: "Liora", points: 2, isVerified: false)
        let user5 = UserModel(name: "Celeana", points: 60, isVerified: true)
        let user6 = UserModel(name: "James", points: 11, isVerified: false)
        let user7 = UserModel(name: "Kazi", points: 10, isVerified: false)
        let user8 = UserModel(name: "Jacks", points: 100, isVerified: true)
        let user9 = UserModel(name: "Scarlet", points: 50, isVerified: true)
        let user10 = UserModel(name: "Adam", points: 0, isVerified: false)
        
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10
            
        ])
    }
}

struct SortFilterMapUse: View {
    
    @State var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                ForEach(vm.filteredArray){ user in
                    VStack(alignment: .leading){
                        Text(user.name)
                            .font(.headline)
                        HStack{
                            Text("Points: \(user.points)")
                            Spacer()
                            if user.isVerified{
                                Image(systemName: "flame.fill")
                            }
                        }
                        }
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color(.systemGray))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    }
            }
        }
    }
}

#Preview {
    SortFilterMapUse()
}
