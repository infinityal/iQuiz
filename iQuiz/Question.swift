//
//  Question.swift
//  iQuiz
//
//  Created by 郑智健 on 5/12/22.
//

import Foundation

class Question {
    let qs: String
    let answers: [String]
    let correct : Int
    
    init(qs: String, answers: [String], correct: Int) {
        self.qs = qs
        self.answers = answers
        self.correct = correct
    }
}
