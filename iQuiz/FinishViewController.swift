//
//  FinishViewController.swift
//  iQuiz
//
//  Created by 郑智健 on 5/12/22.
//

import UIKit

class FinishViewController: UIViewController {
    var quizSubject: String = ""
    var correctNum: Int = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBAction func backBttn(_ sender: Any) {
        let mainViewController = storyboard?.instantiateViewController(withIdentifier: "Home") as? ViewController
        self.navigationController?.pushViewController(mainViewController!, animated: true)
        }
    func scoreCal(){
        if correctNum == 0 {
            titleLabel.text = "TRY AGAIN!"
        } else if correctNum == 3 {
            titleLabel.text = "PERFECT!"
        } else {
            titleLabel.text = "ALMOST!"
        }
        scoreLabel.text = "You got " + String(correctNum) + " out of 3 right!"
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        scoreCal()
    }
}
