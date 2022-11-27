//
//  CharacterListViewController.swift
//  RickMortyApp
//
//  Created by Héctor Rogel on 25/11/22.
//

import Foundation
import UIKit

class CharacterListViewController: UIViewController {
    // MARK: - Properties
    private let viewModel: CharacterListViewModel
    private let characterListViewIdentifier = "CharacterListView"
    private let characterCellIdentifier = "CharacterCellView"
    private var characters: [CharacterListItemViewModel] = []
    private let tableViewCellHeight: CGFloat = 80.0

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!

    // MARK: - Init
    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: characterListViewIdentifier, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewStyle()
        setUpTableView()
        bind()
        viewModel.getCharacters()
    }
    
    // MARK: - Style and configurations
    private func setUpViewStyle() {
        titleLabel.text = "Characters_View_Title".localized()
    }

    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: characterCellIdentifier, bundle: nil), forCellReuseIdentifier: characterCellIdentifier)
    }

    // MARK: - Binding
    private func bind() {
        viewModel.charactersUpdated = { characters in
            self.characters = characters
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Actions
}

extension CharacterListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableViewCellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.present(CharacterDetailConnector(item: characters[indexPath.row]).assembleModule(), animated: true)
    }
}

extension CharacterListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: characterCellIdentifier, for: indexPath) as! CharacterCell
        cell.configureCell(for: characters[indexPath.row])

        if indexPath.row == characters.count - 1 {
            viewModel.getCharacters()
        }
        return cell
    }
}
