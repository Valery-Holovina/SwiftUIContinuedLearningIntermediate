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
    
    var customer : CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData(){
        
        guard let data = getJSONData() else {return}
        print("Json Data: ")
        print(data)
        let jsonString = String(data: data, encoding: .utf8)
        print(jsonString)
        
    }
    
    func getJSONData() -> Data?{
        
        let dictionary: [String: Any] = [
            "id": "12345",
            "name": "Joe",
            "points": 5,
            "isPremium": true
        ]
        
        let jsonData =
        try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        
        return jsonData
    }
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
