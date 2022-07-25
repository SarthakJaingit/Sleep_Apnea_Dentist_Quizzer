//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Sarthak Jain on 5/8/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "If you suffer from sleep apnea, your throat tissues collapse, blocking your air passages and causing you to wake gasping or choking for air.", a: "True"),
        Question(q: "One of the major side effects of sleep apnea is exhaustion, which can make it dangerous to drive your car.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "Occasional pauses in breathing during the night sounds scary but it does not really affect your overall health.", a: "False"),
        Question(q: "Your significant other probably won’t notice the sleep apnea events.", a: "False"),
        Question(q: "If you suffer from sleep apnea, it’s very easy for you to self-diagnose", a: "False"),
        Question(q: "Waking up from sleep apnea events is no big deal", a: "False"),
        Question(q: "Treatment is often simple and noninvasive'.", a: "True"),
        Question(q: "Saying yes to sleep apnea treatment can improve your daily energy level'.", a: "True"),
        Question(q: "Brushing your teeth twice a day is enough to maintain good oral hygiene", a: "False"),
        Question(q: "Bleeding gums is a bad sign", a: "True"),
        Question(q: "There is no “right” way to floss", a: "False")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ usersAnswer: String) -> Bool{
        if usersAnswer == quiz[questionNumber].answer{
            score += 1
            return true
        } else {
            return false
        }
    }
    func getQuestionText() -> String{
        let questionText = quiz[questionNumber].text
        return questionText
    }
    func getProgress() -> Float{
        let progressPercentage = Float(questionNumber) / Float(quiz.count)
        return progressPercentage
    }
    mutating func nextQuestion(){
        if questionNumber < (quiz.count - 1)  {
            questionNumber += 1
        } else {
            print ("You Finished Hoooray!!!")
            questionNumber = 0
        }
    }
    mutating func getScore() -> Int{
        if (questionNumber + 1) != quiz.count{
            return score
        }
        score = 0
        return score
    }
    
}


