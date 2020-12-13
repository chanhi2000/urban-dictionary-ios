//
//  TermCell.swift
//  urban-dictionary-ui
//
//  Created by LeeChan on 12/6/20.
//

import UIKit
import KiloLocoKit

class TermCell: UICollectionViewCell {
    private lazy var wordLabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
        $0.adjustsFontForContentSizeCategory = true
        $0.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    private lazy var definitionLabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
        $0.adjustsFontForContentSizeCategory = true
        $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
    }
    
    private lazy var stackView = UIStackView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TermCell {
    func configureSubViews() {
        stackView.addArrangedSubviews(wordLabel, definitionLabel)
        contentView.addSubview(stackView)
        
//        let guide = contentView.layoutMarginsGuide
        stackView.declare
            .toSuperviewGuide()
    }
}

extension TermCell {
    func populate(with term: Term) {
        wordLabel.text = term.word
        definitionLabel.text = term.strippedDefinition
    }
}

extension TermCell: Reusable {}
