//
//  TermDetailsView.swift
//  urban-dictionary-ui
//
//  Created by LeeChan on 12/12/20.
//

import UIKit
import KiloLocoKit

class TermDetailsView: UIView {

    private lazy var definitionLabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.adjustsFontForContentSizeCategory = true
        $0.font = UIFont.preferredFont(forTextStyle: .title3)
        $0.numberOfLines = 0
    }
    
    private lazy var likesLabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.adjustsFontForContentSizeCategory = true
        $0.font = UIFont.preferredFont(forTextStyle: .body)
    }
    
    private lazy var dislikesLabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.adjustsFontForContentSizeCategory = true
        $0.font = UIFont.preferredFont(forTextStyle: .body)
    }
    
    private lazy var likesStackView = UIStackView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 16
        $0.distribution = .equalSpacing
    }
    
    private lazy var contentStackView = UIStackView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
    }
    
    init() {
        super.init(frame: .zero)
        configureSelf()
        configureSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

private extension TermDetailsView {
    func configureSelf() {
        backgroundColor = .systemBackground
    }
    
    func configureSubViews() {
        likesStackView.addArrangedSubviews(likesLabel, dislikesLabel)
        contentStackView.addArrangedSubviews(definitionLabel, likesStackView)
        addSubview(contentStackView)
        
        likesStackView.declare
            .height(40)
        
        contentStackView.declare
            .toSuperviewGuide()
        
    }
}

extension TermDetailsView {
    func populate(with term: Term) {
        definitionLabel.text = term.strippedDefinition
        likesLabel.text = "Likes: \(term.likes)"
        dislikesLabel.text = "Dislikes: \(term.dislikes)"
    }
}
