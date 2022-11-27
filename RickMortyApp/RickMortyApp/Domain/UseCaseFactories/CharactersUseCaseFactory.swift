//
//  CharactersUseCaseFactory.swift
//  RickMortyApp
//
//  Created by Héctor Rogel on 25/11/22.
//

import Foundation

class CharactersUseCaseFactory {
    // MARK: - Properties
    let charactersGateway: CharactersEntityGateway

    // MARK: - Init
    init(charactersGateway: CharactersEntityGateway) {
        self.charactersGateway = charactersGateway
    }

    // MARK: - Factory methods
    func getCharacters(page: Int = 1, handler: @escaping Handler<CharactersResponse>) -> UseCase {
        GetCharacterUseCase(page: page, entityGateway: charactersGateway, handler: handler)
    }
}
