//
//  PersonLoader.swift
//  DesignPattern
//
//  Created by Azam Mukhtar on 03/05/23.
//

import Foundation



class PersonLoader {
    
    func load(completion: @escaping (Swift.Result<[Person], Error>) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            completion(.success([
                Person(name: "Person 1", age: 23),
                Person(name: "Person 2", age: 12),
                Person(name: "Person 3", age: 34),
                Person(name: "Person 4", age: 13),
                Person(name: "Person 5", age: 45),
            ]))
        }
    }
}


