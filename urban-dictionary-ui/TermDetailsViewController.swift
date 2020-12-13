//
//  TermDetailsViewController.swift
//  urban-dictionary-ui
//
//  Created by LeeChan on 12/12/20.
//

import UIKit

class TermDetailsViewController: UIViewController {
    
    private let term: Term
    private let ui = TermDetailsView()
    
    
    init(term:Term) {
        self.term = term
        super.init(nibName:nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
}

private extension TermDetailsViewController {
    func configureUI() {
        ui.populate(with: term)
    }
}


