//
//  CharacterListViewModel.swift
//  RickMortyApp
//
//  Created by Héctor Rogel on 25/11/22.
//

import Foundation

class CharacterListViewModel {
    // MARK: - Properties
    private let useCaseFactory: CharactersUseCaseFactory
    private var useCase: UseCase?
    private var originalList: [CharacterListItemViewModel] = []
    private var totalPages: Int = 0
    private var nextPage: Int = 1

    var charactersUpdated: (([CharacterListItemViewModel]) -> Void)?
    var characters: [CharacterListItemViewModel] = [] {
        didSet {
            charactersUpdated?(characters)
        }
    }

    // MARK: - Init
    init(useCaseFactory: CharactersUseCaseFactory) {
        self.useCaseFactory = useCaseFactory
    }

    // MARK: - Actions
    func getCharacters() {
        executeGetCharactersUseCase()
    }

    // MARK: - UseCases
    private func executeGetCharactersUseCase() {
        useCase = useCaseFactory.getCharacters(page: self.nextPage, handler: { result in
            if case .success(let response) = result {
                self.totalPages = response.info.pages
                self.characters.append(contentsOf: response.results.map { CharacterListItemViewModel(character: $0) })
                if self.nextPage + 1 < self.totalPages {
                    self.nextPage += 1
                }
                self.useCase = nil
            }
        })
        useCase?.execute()
    }
}
