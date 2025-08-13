//
//  CodableLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 13.08.2025.
//

import SwiftUI


struct CustomerModel: Identifiable, Decodable{
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case points
        case isPremium
    }
    
    init(id: String, name: String, points: Int, isPremium: Bool) {
        self.id = id
        self.name = name
        self.points = points
        self.isPremium = isPremium
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.points = try container.decode(Int.self, forKey: .points)
        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
    }
}


@Observable class CodableViewModel{
    
    var customer : CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData(){
        
        guard let data = getJSONData() else {return}
       
//        if
//        let localData = try? JSONSerialization.jsonObject(with: data, options: []),
//        let dictionary = localData as? [String: Any],
//        let id = dictionary["id"] as? String,
//        let name = dictionary["name"] as? String,
//        let points = dictionary["points"] as? Int,
//        let isPremium = dictionary["isPremium"] as? Bool
//        {
//            
//            let newCustomer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
//            customer = newCustomer
//        }
        //--------------------
//        do{
//            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
//        }catch let error {
//            print("Error decoding")
//        }
        //---------------------
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
        
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
