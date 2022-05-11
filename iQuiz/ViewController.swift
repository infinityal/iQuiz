//
//  ViewController.swift
//  iQuiz
//
//  Created by 郑智健 on 5/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var tableView: UITableView!

    let subjects: [String] = ["Mathematics", "Marvel Super Heroes", "Science"]
    let subtext: [String] = ["Let's test you basic Math knowledge!", "Are you a fan of Marvel? Test it!", "What do you know about Science?"]
    let iconName: [String] = ["math","marvel","sci"]

    
    
    @IBAction func settingBttn(_ sender:Any){
        let alert = UIAlertController(title: "Settings go here", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
                
                present(alert, animated: true)
    }



    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemTableCell", for: indexPath)
        cell.textLabel!.text = subjects[indexPath.row]
        cell.detailTextLabel?.text = subtext[indexPath.row]
        let img = UIImage(named: iconName[indexPath.row])?.resizeImageWithHeight(newW: 140, newH: 80)
        cell.imageView!.image = img
        return cell
    }



    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("test text 123")
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            return nil
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension UIImage{
    func resizeImageWithHeight(newW: CGFloat, newH: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContext(CGSize(width: newW, height: newH))
        self.draw(in: CGRect(x: 0, y: 0, width: newW, height: newH))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

