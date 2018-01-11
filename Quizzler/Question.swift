//
//  Question.swift
//  Quizzler
//
//  Created by Macbook Air on 1/11/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
    
    init (text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
    
}


