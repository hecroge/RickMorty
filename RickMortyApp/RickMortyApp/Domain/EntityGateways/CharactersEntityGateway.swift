//
//  CharactersEntityGateway.swift
//  RickMortyApp
//
//  Created by Héctor Rogel on 25/11/22.
//

import Combine

enum CharactersEntityGatewayError: Error {
    case unaccessible
    case decodingError
}

protocol CharactersEntityGateway {
    func getCharacters(page: Int) -> AnyPublisher<CharactersResponse, CharactersEntityGatewayError>
}
