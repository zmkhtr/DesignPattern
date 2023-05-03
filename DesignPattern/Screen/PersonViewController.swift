//
//  ViewController.swift
//  DesignPattern
//
//  Created by Azam Mukhtar on 03/05/23.
//

import UIKit

class PersonViewController: UITableViewController {

    private let viewModel = PersonViewModel()
    private var persons: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        viewModel.load()
    }

    func bindViewModel() {
        viewModel.onPersonsLoad = { [weak self] persons in
            guard let self = self else { return }
            self.persons = persons
            self.tableView.reloadData()
        }
        
        viewModel.onLoadingStateChange = { [weak self] isLoading in
            guard let self = self else { return }
            print("Handle Loading \(isLoading)")
        }
        
        viewModel.onErrorStateChange = { [weak self] errorMessage in
            guard let self = self else { return }
            print("Handle Error \(errorMessage)")
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

