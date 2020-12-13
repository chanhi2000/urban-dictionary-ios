//
//  TermsViewController.swift
//  urban-dictionary-ui
//
//  Created by LeeChan on 12/6/20.
//

import Combine
import UIKit

class TermsViewController: UIViewController {
    
    private var token = Set<AnyCancellable>()
    private var terms = [Term]()
    private let collectionViewManager = TermsCollectionViewManager()
    private let networkingService = NetworkingService()
    private let searchTerm: String
    private let ui = TermsView()
    
    
    init(searchTerm: String) {
        self.searchTerm = searchTerm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = searchTerm
        configureView()
        getTerms()
        // Do any additional setup after loading the view.
    }
}

private extension TermsViewController {
    func configureView() {
        ui.bindCollectionView(to: collectionViewManager)
        configureManager()
    }
    
    func configureManager() {
        collectionViewManager.cellForRow = { collecionView, indexPath, term in
            guard let cell = collecionView.dequeueReusableCell(withReuseIdentifier: TermCell.reuseIdentifier, for: indexPath) as? TermCell else { return nil }
            cell.populate(with: term)
            return cell
        }
        
        collectionViewManager.selectedItemPublisher.sink  { [weak self] (indexPath) in
            guard let term = self?.terms[indexPath.item] else { return }
            self?.navigateToDetails(for: term)
        }.store(in: &token)
    }
    
    func getTerms() {
        networkingService.define(searchTerm) { [weak self] (result) in
            switch result {
            case .success(let terms):
                self?.terms = terms
                self?.collectionViewManager.set(terms)
                print(terms)
            case .failure(let error):   print(error)
            }
        }
    }
    
    
    func navigateToDetails(for term: Term) {
        let termDetailsVC = TermDetailsViewController(term: term)
        navigationController?.pushViewController(termDetailsVC, animated: true)
    }
}
