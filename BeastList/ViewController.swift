//
//  ViewController.swift
//  BeastList
//
//  Created by Shahad Nasser on 08/12/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var tasks = ["Wake up","Eat","Sleep"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func beastButtonPressed(_ sender: UIButton) {
        if let text = taskTextField.text?.trimmingCharacters(in: .whitespaces), !text.isEmpty
        {
            tasks.append(text)
            tableView.reloadData()
        }
        taskTextField.text = ""
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return an integer that indicates how many rows (cells) to draw
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the UITableViewCell and create/populate it with data then return it
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tasks.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
}

