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
    var qs = ""
    var correctText = ""
    var indicatorText = "You got it RIGHT!"
    var correctStatus: Bool = true
    
    @IBOutlet weak var qsLabel: UILabel!
    @IBOutlet weak var correctAnswer: UIButton!
    @IBOutlet weak var indicator: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func nextBttn(_ sender: Any) {
        if currentNum == totalNum - 1{
            let finishVC = storyboard?.instantiateViewController(withIdentifier: "finish") as? FinishViewController
            finishVC?.quizSubject = quizSubject
            finishVC?.correctNum = correctNum
            navigationController?.pushViewController(finishVC!, animated: true)
        } else {
            let questionVC = storyboard?.instantiateViewController(withIdentifier: "question") as? QuestionViewController
            questionVC?.quizSubject = self.quizSubject
            questionVC?.selectedBttn = 0
            questionVC?.correctNum = self.correctNum
            questionVC?.currentNum = self.currentNum + 1
            navigationController?.pushViewController(questionVC!, animated: true)
        }
    }

    
    
    
    @IBAction func backBttn(_ sender: Any) {
        let mainViewController = storyboard?.instantiateViewController(withIdentifier: "Home") as? ViewController
        self.navigationController?.pushViewController(mainViewController!, animated: true)
        }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        correctAnswer.setTitle(correctText, for: .normal)
        indicator.text = indicatorText
        if correctStatus == false {
            correctAnswer.tintColor = UIColor.red
        }
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
            nextBttn(self)
        }
    }
}
