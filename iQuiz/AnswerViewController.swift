//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by 郑智健 on 5/12/22.
//

import UIKit

class AnswerViewController: UIViewController {
    var quizSubject: String = ""
    var currentNum: Int = 0
    var correctNum: Int = 0
    var selectedBttn: Int = 0
    let totalNum: Int = 3
    
    
    
    
    @IBAction func backBttn(_ sender: Any) {
        let mainViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.navigationController?.pushViewController(mainViewController!, animated: true)
        }
    
    override func viewDidLoad() {
            super.viewDidLoad()
    }
}
