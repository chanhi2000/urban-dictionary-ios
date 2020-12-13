//
//  SearchView.swift
//  urban-dictionary-ui
//
//  Created by LeeChan on 12/6/20.
//

import Combine
import KiloLocoKit
import DeclareUI
import UIKit

protocol SearchViewDelegate : AnyObject{
    func didTapSearch(for searchTerm: String)
}

class SearchView: UIView {
    private lazy var textField = UITextField.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Enter a term"
    }
    
    private lazy var searchButton = UIButton.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Search", for: .normal)
        $0.backgroundColor = .systemPurple
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(didTapSearchButton), for: .touchUpInside)
    }
    
    private lazy var stackView = UIStackView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 16
    }
    
    weak var delegate: SearchViewDelegate?
    
    init() {
        super.init(frame: .zero)
        configureSelf()
        configureSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

private extension SearchView {
    @objc
    func didTapSearchButton() {
        let searchTerm = textField.text ?? ""
        delegate?.didTapSearch(for: searchTerm)
    }
    
    func configureSelf() {
        backgroundColor = .systemBackground
    }
    
    func configureSubViews() {
        stackView.addArrangedSubviews(textField, searchButton)
        addSubview(stackView)
        
        textField.declare
            .constrainTo(.leading, .trailing)
            .height(40)
        
        searchButton.declare
            .width(150)
            .height(50)
        
        stackView.declare
            .centerVertically()
            .constrainTo(.leadingWithOffset(16), .trailingWithOffset(16))
    }
}
