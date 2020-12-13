//
//  TermsView.swift
//  urban-dictionary-ui
//
//  Created by LeeChan on 12/6/20.
//

import Combine
import KiloLocoKit
import DeclareUI
import UIKit

class TermsView: UICollectionViewCell {
    
    private lazy var collectionView: UICollectionView = {
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        cv.register(TermCell.self, forCellWithReuseIdentifier: TermCell.reuseIdentifier)
        return cv
    }()
    
    init() {
        super.init(frame: .zero)
        configureSelf()
        configureSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

private extension TermsView {
    func configureSelf() {
        backgroundColor = .systemBackground
    }
    
    func configureSubViews() {
        addSubview(collectionView)
        collectionView.declare
            .toSuperview()
    }
}

extension TermsView {
    func bindCollectionView(to manager: TermsCollectionViewManager) {
        manager.manage(collectionView)
    }
}

