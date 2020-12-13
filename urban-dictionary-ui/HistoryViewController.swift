//
//  HistoryViewController.swift
//  urban-dictionary-ui
//
//  Created by LeeChan on 12/6/20.
//

import Amplify
import Combine
import UIKit

class HistoryViewController: UIViewController {
    
    private var tokens = Set<AnyCancellable>()
    private var searchedTerms = [SearchedTerm]()
    private let ui = HistoryView()
    
    override func loadView() {
        view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getHistory()
    }
}

private extension HistoryViewController {
    func configureUI() {
        ui.bindTableView(to: self)
    }
    
    func getHistory() {
        Amplify.DataStore.query(SearchedTerm.self, sort:.descending(SearchedTerm.keys.id))
            .receive(on: DispatchQueue.main)
            .sink {
                print($0)
            } receiveValue: { [weak self] (searchedTerms) in
                self?.searchedTerms = searchedTerms
                self?.ui.reload()
            }.store(in: &tokens)
    }
    
    func navigateToResult(for searchedTerm: SearchedTerm) {
        let termsVC = TermsViewController(searchTerm: searchedTerm.value)
        navigationController?.pushViewController(termsVC, animated: true)
        
    }
}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchedTerms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchedTermCell.reuseIdentifier, for: indexPath) as? SearchedTermCell else { return UITableViewCell() }
        let searchedTerm = searchedTerms[indexPath.row]
        cell.populate(with: searchedTerm)
        return cell
    }
}

extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchedTerm = searchedTerms[indexPath.row]
        navigateToResult(for: searchedTerm)
    }
}
