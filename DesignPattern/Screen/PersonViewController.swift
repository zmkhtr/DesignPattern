//
//  PersonViewController.swift
//  DesignPattern
//
//  Created by Azam Mukhtar on 03/05/23.
//

import UIKit

class PersonViewController: UITableViewController {

    private let presenter = PersonPresenter()
    private var persons: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.delegate = self
        presenter.load()
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


extension PersonViewController: PersonViewDelegate {
    func onLoadingStateChange(isLoading: Bool) {
        print("Handle loading \(isLoading)")
    }
    
    func onErrorStateChange(error: String?) {
        print("Handle error \(error)")
    }
    
    func onPersonsLoad(persons: [Person]) {
        self.persons = persons
        self.tableView.reloadData()
    }
}
