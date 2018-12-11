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

// MARK: - queryControllerDelegate

protocol QueryControllerDelegate: class {
    func queryController(_ viewController: QueryController, didCancel questionGroup: QuestionGroup, at questionIndex: Int)
    func queryController(_ viewController: QueryController, didComplete questionGroup: QuestionGroup, at questionIndex: Int)
}

class QueryController: UIViewController {

    var questionGroup = QuestionGroup.basicPhrases()
    var questionIndex  = 0
    var correctCount = 0
    var incorrectCount = 0
    
    let questionView = QueryView()
    
    weak var delegate: QueryControllerDelegate?
    
    private lazy var queryIndexItem : UIBarButtonItem = {
        let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        return item
    }()
    
    override func loadView() {
        view = questionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = questionGroup.title
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleAnswerLabel))
        questionView.addGestureRecognizer(tap)
        
        questionView.correctButton.addTarget(self, action: #selector(handleCorrect), for: .touchUpInside)
        questionView.incorrectButton.addTarget(self, action: #selector(handleIncorrect), for: .touchUpInside)
        setupCancelButton()
        showQuestion()
    }

    func setupCancelButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu"), landscapeImagePhone: nil,
                                                           style: .plain, target: self,
                                                           action: #selector(handleCancelPressed))
    }
    func showQuestion() {
        let question = questionGroup.questions[questionIndex]
        
        questionView.answerLabel.text = question.answer
        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        
        questionView.answerLabel.isHidden = true
        questionView.hintLabel.isHidden = true
        
        queryIndexItem.title = "\(questionIndex + 1)/\(questionGroup.questions.count)"
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
    
    @objc func handleCancelPressed(sender: UIBarButtonItem) {
        delegate?.queryController(self, didCancel: questionGroup, at: questionIndex)
    }
    
    func showNextQuestion() {
        questionIndex += 1
        
        guard questionIndex < questionGroup.questions.count else {
            delegate?.queryController(self, didComplete: questionGroup, at: questionIndex)
            return
        }
        
        showQuestion()
    }
}

