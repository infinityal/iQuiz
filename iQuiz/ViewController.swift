//
//  ViewController.swift
//  iQuiz
//
//  Created by 郑智健 on 5/10/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var quiz = [Quizzes]()
    
    let subjects: [String] = ["Mathematics", "Marvel Super Heroes", "Science"]
    let subtext: [String] = ["Let's test you basic Math knowledge!", "Are you a fan of Marvel? Test it!", "What do you know about Science?"]
    let iconName: [String] = ["math","marvel","sci"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func settingBttn(_ sender:Any){
        let alert = UIAlertController(title: "Settings go here", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
                
                present(alert, animated: true)
    }
}


    
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemTableCell", for: indexPath)
        cell.textLabel!.text = subjects[indexPath.row]
        cell.detailTextLabel!.text = subtext[indexPath.row]
        
        let icons = UIImage(named: iconName[indexPath.row])
                cell.imageView?.image = icons
                
                return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("test text 123")
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            return nil
        }
}

