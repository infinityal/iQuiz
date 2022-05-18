//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by 郑智健 on 5/12/22.
//

import UIKit

class QuestionViewController: UIViewController {
    var quizSubject = ""
    var currentNum: Int = 0
    var correctNum: Int = 0
    var selectedBttn: Int = -1
    let totalNum: Int = 3
    
    @IBOutlet weak var qsLabel: UILabel!
    @IBOutlet weak var bttn1: UIButton!
    @IBOutlet weak var bttn2: UIButton!
    @IBOutlet weak var bttn3: UIButton!
    @IBOutlet weak var bttn4: UIButton!
    @IBOutlet weak var submitBttn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    let questions: [Question] = []

    
    @IBAction func backBttn(_ sender: Any) {
        let mainViewController = storyboard?.instantiateViewController(withIdentifier: "Home") as? ViewController
        self.navigationController?.pushViewController(mainViewController!, animated: true)
        }
    
    @IBAction func answerBttn(_ sender: UIButton!) {
        submitBttn.alpha = 1
        submitBttn.isEnabled = true
        switch sender.tag {
        case 1:
                        selectedBttn = 0
                        bttn1.isSelected = true
                        bttn2.isSelected = false
                        bttn3.isSelected = false
                        bttn4.isSelected = false
                    case 2:
                        selectedBttn = 1
                        bttn1.isSelected = false
                        bttn2.isSelected = true
                        bttn3.isSelected = false
                        bttn4.isSelected = false
                    case 3:
                        selectedBttn = 2
                        bttn1.isSelected = false
                        bttn2.isSelected = false
                        bttn3.isSelected = true
                        bttn4.isSelected = false
                    case 4:
                        selectedBttn = 3
                        bttn1.isSelected = false
                        bttn2.isSelected = false
                        bttn3.isSelected = false
                        bttn4.isSelected = true
                    default:
                        selectedBttn = -1
        }
    }
     
    @IBAction func submitBttn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "answer") as? AnswerViewController
        if selectedBttn != questions[currentNum].correct {
            vc?.correctStatus = false
        } else {
            correctNum += 1
        }
        vc?.qs = questions[currentNum].qs
        vc?.quizSubject = quizSubject
        vc?.selectedText = questions[currentNum].answers[selectedBttn]
        vc?.correctText = questions[currentNum].answers[questions[currentNum].correct]
        vc?.currentNum = currentNum
        vc?.correctNum = correctNum
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = quizSubject
        qsLabel.text = questions[currentNum].qs
        bttn1.setTitle(questions[currentNum].answers[0], for: .normal)
        bttn2.setTitle(questions[currentNum].answers[1], for: .normal)
        bttn3.setTitle(questions[currentNum].answers[2], for: .normal)
        bttn4.setTitle(questions[currentNum].answers[3], for: .normal)
            
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
            let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
                
            leftSwipe.direction = .left
            rightSwipe.direction = .right

            view.addGestureRecognizer(leftSwipe)
            view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func handleSwipes(_  sender: UISwipeGestureRecognizer){
        if sender.direction == .left {
            currentNum = 0
            correctNum = 0
            backBttn(self)
        }
        if sender.direction == .right {
            submitBttn(self)
        }
    }
}
