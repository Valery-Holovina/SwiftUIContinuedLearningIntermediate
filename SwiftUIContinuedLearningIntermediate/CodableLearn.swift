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
       
        if
        let localData = try? JSONSerialization.jsonObject(with: data, options: []),
        let dictionary = localData as? [String: Any],
        let id = dictionary["id"] as? String,
        let name = dictionary["name"] as? String,
        let points = dictionary["points"] as? Int,
        let isPremium = dictionary["isPremium"] as? Bool
        {
            
            let newCustomer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
            customer = newCustomer
        }
        
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
