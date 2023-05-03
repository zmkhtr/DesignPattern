//
//  ViewController.swift
//  DesignPattern
//
//  Created by Azam Mukhtar on 03/05/23.
//

import UIKit

class PersonViewController: UITableViewController {

    private let loader = PersonLoader()
    private var persons: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        load()
    }

    func load() {
        loader.load { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let persons):
                self.persons = persons
                self.tableView.reloadData()
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "PersonCell")
        var content = cell.defaultContentConfiguration()
        
        let person = persons[indexPath.row]
        content.image = UIImage(systemName: "person")
        content.text = person.name
        content.secondaryText = "Age \(person.age)"

        cell.contentConfiguration = content

        return cell
    }
    
}

