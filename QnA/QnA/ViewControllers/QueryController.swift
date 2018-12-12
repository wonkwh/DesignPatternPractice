//
//  ViewController.swift
//  QnA
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
    func queryController(_ viewController: QueryController, didCancel queryGroup: QueryGroup, at queryIndex: Int)
    func queryController(_ viewController: QueryController, didComplete queryGroup: QueryGroup, at queryIndex: Int)
}

class QueryController: UIViewController {

    var queryGroup = QueryGroup.basicPhrases()
    var queryIndex  = 0
    var correctCount = 0
    var incorrectCount = 0
    
    let queryView = QueryView()
    
    weak var delegate: QueryControllerDelegate?
    
    private lazy var queryIndexItem : UIBarButtonItem = {
        let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        return item
    }()
    
    override func loadView() {
        view = queryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = queryGroup.title
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleAnswerLabel))
        queryView.addGestureRecognizer(tap)
        
        queryView.correctButton.addTarget(self, action: #selector(handleCorrect), for: .touchUpInside)
        queryView.incorrectButton.addTarget(self, action: #selector(handleIncorrect), for: .touchUpInside)
        setupCancelButton()
        showquery()
    }

    func setupCancelButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu"), landscapeImagePhone: nil,
                                                           style: .plain, target: self,
                                                           action: #selector(handleCancelPressed))
    }
    func showquery() {
        let query = queryGroup.querys[queryIndex]
        
        queryView.answerLabel.text = query.answer
        queryView.promptLabel.text = query.prompt
        queryView.hintLabel.text = query.hint
        
        queryView.answerLabel.isHidden = true
        queryView.hintLabel.isHidden = true
        
        queryIndexItem.title = "\(queryIndex + 1)/\(queryGroup.querys.count)"
    }
    
    @objc func toggleAnswerLabel(_ sender: Any) {
        queryView.answerLabel.toggle()
        queryView.hintLabel.toggle()
    }
    
    @objc func handleCorrect(_ sender: Any) {
        correctCount += 1
        queryView.correctCountLabel.text = "\(correctCount)"
        showNextquery()
    }
    
    @objc func handleIncorrect(_ sender: Any) {
        incorrectCount += 1
        queryView.incorrectCountLabel.text = "\(incorrectCount)"
        showNextquery()
    }
    
    @objc func handleCancelPressed(sender: UIBarButtonItem) {
        delegate?.queryController(self, didCancel: queryGroup, at: queryIndex)
    }
    
    func showNextquery() {
        queryIndex += 1
        
        guard queryIndex < queryGroup.querys.count else {
            delegate?.queryController(self, didComplete: queryGroup, at: queryIndex)
            return
        }
        
        showquery()
    }
}

