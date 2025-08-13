//
//  CodableLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 13.08.2025.
//

import SwiftUI


struct CustomerModel: Identifiable{
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
}


@Observable class CodableViewModel{
    
    var customer : CustomerModel? = CustomerModel(id: "1", name: "Lera", points: 5, isPremium: true)
}


struct CodableLearn: View {
    
    @State var vm = CodableViewModel()
    
    var body: some View {
        VStack(spacing:20){
            if let customer = vm.customer{
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

#Preview {
    CodableLearn()
}
