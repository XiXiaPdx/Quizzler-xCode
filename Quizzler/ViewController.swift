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
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        checkAnswer(ofAnswerChoice:sender.tag)
        nextQuestion()
    }
    
    func updateUI() {
        questionLabel.text = currentQuestionText
        scoreLabel.text = "Score: \(currentScore)"
        progressLabel.text = "Question \(currentQuestion+1) of \(allQuestions.list.count)"
        let screenWidth: CGFloat = view.frame.size.width
        let barWidth: CGFloat = screenWidth/CGFloat(allQuestions.list.count)*CGFloat(currentQuestion+1)
        print(barWidth)
        progressBar.frame.size.width = barWidth
    }
    
    func nextQuestion() {
        currentQuestion += 1
        if currentQuestion == allQuestions.list.count{
            let restartAction: UIAlertAction = UIAlertAction(title: "Restart Quiz", style: .default, handler: {
                (UIAlertAction) in self.startOver()
            } )
            let alert: UIAlertController = UIAlertController (title: "You're Done!", message: "Start over?", preferredStyle: .alert)
                alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        } else {
        currentQuestionText = allQuestions.list[currentQuestion].questionText
            updateUI()
        }
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
            currentScore += 100
        } else {
        }
    }
    
    
    func startOver() {
       currentQuestion = -1
       currentScore = 0
       nextQuestion()
    }
}
