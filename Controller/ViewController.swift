//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Sarthak Jain on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    var timer = Timer()
    var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let usersAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(usersAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        let progressPercentage = quizBrain.getProgress()
        progressView.progress = progressPercentage
    }
}


    

