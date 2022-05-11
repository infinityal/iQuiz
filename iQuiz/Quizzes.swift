//
//  Quizes.swift
//  iQuiz
//
//  Created by 郑智健 on 5/10/22.
//

import Foundation

class Quizzes {
    var subject: String!
    var subtext: String!
    var iconName: String!
    
    public init(subject:String, subtext:String, iconName:String) {
        self.subject = subject
        self.subtext = subtext
        self.iconName = iconName
    }
}
