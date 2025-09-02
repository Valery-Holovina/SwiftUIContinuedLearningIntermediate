//
//  PhotoModel.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 01.09.2025.
//

import Foundation

struct PhotoModel: Identifiable, Codable{
    
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
   
}

/*
 "id": 1,
   "title": "Fjallraven - Foldsack No. 1 Backpack",
   "price": 109.95,
   "description": "Your perfect pack for everyday use...",
   "category": "men's clothing",
   "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
 */
