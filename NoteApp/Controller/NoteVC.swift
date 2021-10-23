//
//  NoteVC.swift
//  NoteApp
//
//  Created by Egemen on 23.10.2021.
//

import UIKit
import CoreData

struct Note1 {
    var savedNote: String
    var date: Date
}
let appdelegate = UIApplication.shared.delegate as! AppDelegate
let context = appdelegate.persistentContainer.viewContext
var notes = [Note1]()

class NoteVC: UITableViewController {
    @IBOutlet var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }


    @IBAction func addButton(_ sender: Any) {
        let alert = UIAlertController(title: "Add Note", message: "This is my note.", preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField{
            texfield in texfield.placeholder = "Note"
        }
                //add a cancel button
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
                // add an action (button)
        alert.addAction(UIAlertAction(title: "Add",
                                      style: UIAlertAction.Style.default,
                                      handler: {_ in
            notes.insert(Note1.init(savedNote: "\(alert.textFields![0].text!)", date: Date()),at: 0)
            self.table.insertRows(at: [IndexPath(row: 0, section: 0)], with: .left)
        }
                                      ))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        cell.detailTextLabel?.text = dateFormatter.string(from: notes[indexPath.row].date)
        cell.textLabel?.text = notes[indexPath.row].savedNote
        return cell
        
    }

}
