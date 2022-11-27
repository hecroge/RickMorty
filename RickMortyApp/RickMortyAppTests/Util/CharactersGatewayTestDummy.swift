//
//  CharactersGatewayTestDummy.swift
//  RickMortyAppTests
//
//  Created by Héctor Rogel on 27/11/22.
//

import Combine
@testable import RickMortyApp

class CharactersGatewayTestDummy: CharactersEntityGateway {
    func getCharacters(page: Int) -> AnyPublisher<CharactersResponse, CharactersEntityGatewayError> {
        Empty().setFailureType(to: CharactersEntityGatewayError.self).eraseToAnyPublisher()
    }
}
