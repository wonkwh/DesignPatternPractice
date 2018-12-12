//
//  ViewController.swift
//  RabbleWabble
//
//  Created by wonkwh on 03/12/2018.
//  Copyright © 2018 wonkwh. All rights reserved.
//

import UIKit

extension UIView {
    func toggle() {
        isHidden = !isHidden
    }
}


class QueryController: UIViewController {

    var questionGroup = QuestionGroup.basicPhrases()
    var questionIndex  = 0
    var correctCount = 0
    var incorrectCount = 0
    
    let questionView = QueryView()
    
    override func loadView() {
        view = questionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleAnswerLabel))
        questionView.addGestureRecognizer(tap)
        
        questionView.correctButton.addTarget(self, action: #selector(handleCorrect), for: .touchUpInside)
        questionView.incorrectButton.addTarget(self, action: #selector(handleIncorrect), for: .touchUpInside)
        showQuestion()
    }

    func showQuestion() {
        let question = questionGroup.questions[questionIndex]
        
        questionView.answerLabel.text = question.answer
        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        
        questionView.answerLabel.isHidden = true
        questionView.hintLabel.isHidden = true
    }
    
    @objc func toggleAnswerLabel(_ sender: Any) {
        questionView.answerLabel.toggle()
        questionView.hintLabel.toggle()
    }
    
    @objc func handleCorrect(_ sender: Any) {
        correctCount += 1
        questionView.correctCountLabel.text = "\(correctCount)"
        showNextQuestion()
    }
    
    @objc func handleIncorrect(_ sender: Any) {
        incorrectCount += 1
        questionView.incorrectCountLabel.text = "\(incorrectCount)"
        showNextQuestion()
    }
    
    func showNextQuestion() {
        questionIndex += 1
        
        guard questionIndex < questionGroup.questions.count else {
            return
        }
        
        showQuestion()
    }
}

