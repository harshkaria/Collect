//
//  ViewControllerB.swift
//  Collect
//
//  Created by Norris Chan on 7/14/19.
//  Copyright © 2019 The Collective. All rights reserved.
//

import UIKit

 class ViewControllerB: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // creates an array for the list of names
    var recipient: [Names] = []
    var receiptName: String = ""
    
    var peopleArray : [PeopleList] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // displays number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        let person = peopleArray[indexPath.row]
        
        
        cell.textLabel!.text = person.nameOfPerson!
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }
    
    func fetchPeople(receiptName: String)
    {
        //Fetches the specific data
        guard let peopleItems = PeopleList.FetchPeopleList(with: receiptName)
            //If data is not found, returns no data found
            else {
                print("Data Not Found")
                return
        }
        print("SUCCESS")
        peopleArray = peopleItems
        print(peopleArray.count)
    }
    @objc func addMethod()
    {
        let alert = UIAlertController(title: "Add Receipient", message: "Enter their name", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Enter First Name"
        })
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (action) in
            if let name = alert.textFields?.first?.text
            {
                print(name)
                if (name != "")
                {
                    addPerson(nameOfPerson: name, nameOfReceipt: self.receiptName)
                }
                self.fetchPeople(receiptName: self.receiptName)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
        
    }
    // displays list
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self;
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMethod))
        self.title = "Receipients"
        fetchPeople(receiptName: receiptName)
        self.tableView.reloadData()
    }
    
    
}

class Names {
    var names = ""
    convenience init(names2: String) {
        self.init()
        self.names = names2
    }
}
