//
//  SearchViewController.swift
//  urban-dictionary-ui
//
//  Created by LeeChan on 12/6/20.
//

import Amplify
import Combine
import UIKit

class SearchViewController: UIViewController {
    private var tokens = Set<AnyCancellable>()
    
    private let ui: SearchView = SearchView()
    
    override func loadView() {
        view = ui
//        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

private extension SearchViewController {
    
    func configureView() {
        ui.delegate = self
    }
    
    func updateHistory(with searchTerm: String) {
        let searchedTerm = SearchedTerm(value: searchTerm)
        Amplify.DataStore.save(searchedTerm).sink { (completion) in
            print(completion)
        } receiveValue: { _ in
            print("Added \(searchedTerm.value) to history")
        }.store(in: &tokens)

    }
    
    func navigateToResult(for searchTerm: String) {
        let termsVC = TermsViewController(searchTerm: searchTerm)
        navigationController?.pushViewController(termsVC, animated: true)
    }
}

extension SearchViewController: SearchViewDelegate {
    func didTapSearch(for searchTerm: String) {
        print("searched for: ", searchTerm)
        updateHistory(with: searchTerm)
        navigateToResult(for: searchTerm)
    }
    
}
