//
//  Question.swift
//  iQuiz
//
//  Created by 郑智健 on 5/12/22.
//

import Foundation

class Question {
    let qs: String
    let A1 : String
    let A2 : String
    let A3 : String
    let A4 : String
    let correct : Int
    
    init(qs: String, A1: String, A2: String, A3: String, A4: String, correct: Int) {
        self.qs = qs
        self.A1 = A1
        self.A2 = A2
        self.A3 = A3
        self.A4 = A4
        self.correct = correct
    }
}
