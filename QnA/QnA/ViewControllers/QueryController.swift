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
    func queryController(_ viewController: QueryController, didCancel queryStrategy: QueryStrategy, at queryIndex: Int)
    func queryController(_ viewController: QueryController, didComplete queryStrategy: QueryStrategy, at queryIndex: Int)
}

class QueryController: UIViewController {

    //var queryGroup = QueryGroup.basicPhrases()
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
    
    var queryStrategy: QueryStrategy! {
        didSet {
            navigationItem.title = queryStrategy.title
        }
    }
    
    override func loadView() {
        view = queryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleAnswerLabel))
        queryView.addGestureRecognizer(tap)
        
        queryView.correctButton.addTarget(self, action: #selector(handleCorrect), for: .touchUpInside)
        queryView.incorrectButton.addTarget(self, action: #selector(handleIncorrect), for: .touchUpInside)
        setupCancelButton()
        showQuery()
    }

    func setupCancelButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu"), landscapeImagePhone: nil,
                                                           style: .plain, target: self,
                                                           action: #selector(handleCancelPressed))
    }
    func showQuery() {
        let query = queryStrategy.currentQuery()
        debugPrint(query)
        
        queryView.answerLabel.text = query.answer
        queryView.promptLabel.text = query.prompt
        queryView.hintLabel.text = query.hint
        
        queryView.answerLabel.isHidden = true
        queryView.hintLabel.isHidden = true
        
        queryIndexItem.title = queryStrategy.queryIndexTitle()
    }
    
    @objc func toggleAnswerLabel(_ sender: Any) {
        queryView.answerLabel.toggle()
        queryView.hintLabel.toggle()
    }
    
    @objc func handleCorrect(_ sender: Any) {
        let query = queryStrategy.currentQuery()
        queryStrategy.markQueryCorrect(query)
        queryView.correctCountLabel.text = "\(correctCount)"
        showNextQuery()
    }
    
    @objc func handleIncorrect(_ sender: Any) {
        let query = queryStrategy.currentQuery()
        queryStrategy.markQueryInCorrect(query)
        queryView.incorrectCountLabel.text = "\(incorrectCount)"
        showNextQuery()
    }
    
    @objc func handleCancelPressed(sender: UIBarButtonItem) {
        delegate?.queryController(self, didCancel: queryStrategy, at: queryIndex)
    }
    
    func showNextQuery() {
        guard queryStrategy.nextQuery() else {
            delegate?.queryController(self, didComplete: queryStrategy, at: queryIndex)
            return
        }
        
        showQuery()
    }
}

