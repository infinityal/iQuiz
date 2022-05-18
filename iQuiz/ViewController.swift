//
//  ViewController.swift
//  iQuiz
//
//  Created by 郑智健 on 5/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var tableView: UITableView!
    
    var subjects: [String] = []
    var subtext: [String] = []
    var quiz: [Dictionary<String, Any>] = []
    let questions: [Question] = []
    
    var currentUrl = UserDefaults.standard.string(forKey: "url") ?? "http://tednewardsandbox.site44.com/questions.json"
    let newUrl = ""
    
    @IBAction func settingBttn(_ sender:Any){
        let alert = UIAlertController(title: "Settings", message: "Settings", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
        }
        let textField = alert.textFields![0]
        alert.addAction(UIAlertAction(title: "Check now", style: .default, handler:  {(action) -> Void in }))
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let vc = storyboard?.instantiateViewController(withIdentifier: "question") as? QuestionViewController
        let selectedRow = subjects[indexPath.row]
        
        vc!.quizSubject = selectedRow
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    func updateQuiz(data: [Dictionary<String, Any>]) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        do {
            let newUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("quizData.json")
            let dataInit = try Data(contentsOf: newUrl)
            let data = try JSONSerialization.jsonObject(with: dataInit) as! [Dictionary<String, Any>]
            for item in data {
                subjects.append(item["title"] as! String)
                subtext.append(item["desc"] as! String)
            }
        } catch {
            print(error)
        }
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

