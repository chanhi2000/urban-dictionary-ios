//
//  SearchedTermCell.swift
//  urban-dictionary-ui
//
//  Created by LeeChan on 12/13/20.
//

import DeclareUI
import KiloLocoKit
import UIKit

class SearchedTermCell: UITableViewCell {
    private lazy var label = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.adjustsFontForContentSizeCategory = true
        $0.font = UIFont.preferredFont(forTextStyle: .title3)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension SearchedTermCell {
    func populate(with searchedTerm: SearchedTerm) {
        label.text = searchedTerm.value
    }
}

private extension SearchedTermCell {
    func configureSubviews() {
        contentView.addSubview(label)
        label.declare
            .toSuperviewGuide()
    }
}

extension SearchedTermCell : Reusable {}
