//
//  PersonViewModel.swift
//  DesignPattern
//
//  Created by Azam Mukhtar on 03/05/23.
//

import Foundation

class PersonViewModel {
    typealias Observer<T> = (T) -> Void
    
    private let loader = PersonLoader()

    var onLoadingStateChange: Observer<Bool>?
    var onErrorStateChange: Observer<String?>?
    var onPersonsLoad: Observer<[Person]>?
    
    
    func load() {
        onLoadingStateChange?(true)
        onErrorStateChange?(nil)
        
        loader.load { [weak self] result in
            guard let self = self else { return }
            self.onLoadingStateChange?(false)
            
            switch result {
            case let .success(persons):
                self.onPersonsLoad?(persons)
            case .failure:
                self.onErrorStateChange?("Error Fetching Data")
            }
        }
    }
}
