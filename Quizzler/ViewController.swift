//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Guts filled out by Xi Xia on 1/15/2018.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    let allQuestions: QuestionBank = QuestionBank()
    var currentQuestion: Int = -1
    var currentQuestionText: String? = nil
    var currentScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        updateUI()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        checkAnswer(ofAnswerChoice:sender.tag)
        nextQuestion()
        updateUI()
    }
    
    func updateUI() {
      questionLabel.text = currentQuestionText
        scoreLabel.text = "\(currentScore)"
    }
    
    func nextQuestion() {
        currentQuestion += 1
        print(allQuestions.list.count)
        if currentQuestion == allQuestions.list.count{
            startOver()
        }
        currentQuestionText = allQuestions.list[currentQuestion].questionText
    }
    
    
    func checkAnswer(ofAnswerChoice answerChoice: Int) {
        var trueFalse: Bool? = nil
        switch answerChoice{
        case 1:
            trueFalse = true
        default:
            trueFalse = false
        }
        
        if trueFalse ==  allQuestions.list[currentQuestion].answer {
            print("Correct")
        } else {
            print ("Incorrect")
        }
    }
    
    
    func startOver() {
       currentQuestion = 0
       currentScore = 0
    }
    
}
