//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by 郑智健 on 5/12/22.
//

import UIKit

class QuestionViewController: UIViewController {
    var quizSubject: String = ""
    var currentNum: Int = 0
    var correctNum: Int = 0
    var selectedBttn: Int = 0
    let totalNum: Int = 3
    
    @IBOutlet weak var qsLabel: UILabel!
    @IBOutlet weak var bttn1: UIButton!
    @IBOutlet weak var bttn2: UIButton!
    @IBOutlet weak var bttn3: UIButton!
    @IBOutlet weak var bttn4: UIButton!
    @IBOutlet weak var submitBttn: UIButton!
    
    let math: [Question] = [Question(qs:"If 1=3,2=3,3=5,4=4,5=4,Then,6=?",A1: "1",A2: "2",A3: "3",A4: "4",correct: 3),
                            Question(qs: "What is our current numerical system based on?", A1: "Hindu-Arabic numeral system", A2: "Roman numeral system", A3: "Greeks numeral system", A4: "English numeral system", correct: 1),
                            Question(qs: "Which number is the sum of its multiples when you add the single digits together?", A1: "3", A2: "6", A3: "9", A4: "11", correct: 3)]
    let marvel: [Question] = [Question(qs: "Who is Tony Stark’s father?", A1: "Henry Stark", A2: "Mark Stark", A3: "Howard Stark", A4: "Thomas Stark", correct: 3),
                               Question(qs: "What type of doctor is Doctor Strange?", A1: "Cardiothoracic surgeon", A2: "Plastic surgeon", A3: "Neurological surgeon", A4: "General surgeon", correct: 3),
                               Question(qs: "Which movie kicked off the Marvel Cinematic Universe?", A1: "Spiderman", A2: "Doctor Strange", A3: "Ironman", A4: "Captain America", correct: 3)]
    let science: [Question] = [Question(qs: "Would you weigh more or less on Mars?", A1: "Equal", A2: "More", A3: "Less", A4: "Don't Know", correct: 3),
                               Question(qs: "What color is the sunset on Mars?", A1: "Red", A2: "Yellow", A3: "Blue", A4: "Green", correct: 3),
                               Question(qs: "What is the hottest planet in the solar system?", A1: "Mercury", A2: "Jupiter", A3: "Venus", A4: "Neptune", correct: 3)]
    
    @IBAction func backBttn(_ sender: Any) {
        let mainViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.navigationController?.pushViewController(mainViewController!, animated: true)
        }
    
    @IBAction func answerBttn(_ sender: UIButton!) {
        submitBttn.alpha = 1
        submitBttn.isEnabled = true
        switch sender.tag {
        case 1:
                        selectedBttn = 1
                        bttn1.isSelected = true
                        bttn2.isSelected = false
                        bttn3.isSelected = false
                        bttn4.isSelected = false
                    case 2:
                        selectedBttn = 2
                        bttn1.isSelected = false
                        bttn2.isSelected = true
                        bttn3.isSelected = false
                        bttn4.isSelected = false
                    case 3:
                        selectedBttn = 3
                        bttn1.isSelected = false
                        bttn2.isSelected = false
                        bttn3.isSelected = true
                        bttn4.isSelected = false
                    case 4:
                        selectedBttn = 4
                        bttn1.isSelected = false
                        bttn2.isSelected = false
                        bttn3.isSelected = false
                        bttn4.isSelected = true
                    default:
                        selectedBttn = 0
        }
    }
     
    @IBAction func submitBttn(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            switch quizSubject {
            case "Mathematics":
                qsLabel.text = math[currentNum].qs
                bttn1.setTitle(math[currentNum].A1, for: .normal)
                bttn2.setTitle(math[currentNum].A2, for: .normal)
                bttn3.setTitle(math[currentNum].A3, for: .normal)
                bttn4.setTitle(math[currentNum].A4, for: .normal)
            case "Marvel Super Heroes":
                qsLabel.text = marvel[currentNum].qs
                bttn1.setTitle(marvel[currentNum].A1, for: .normal)
                bttn2.setTitle(marvel[currentNum].A2, for: .normal)
                bttn3.setTitle(marvel[currentNum].A3, for: .normal)
                bttn4.setTitle(marvel[currentNum].A4, for: .normal)
            case "Science":
                qsLabel.text = science[currentNum].qs
                bttn1.setTitle(science[currentNum].A1, for: .normal)
                bttn2.setTitle(science[currentNum].A2, for: .normal)
                bttn3.setTitle(science[currentNum].A3, for: .normal)
                bttn4.setTitle(science[currentNum].A4, for: .normal)
            default:
                NSLog("Error")
        }
    }
}
