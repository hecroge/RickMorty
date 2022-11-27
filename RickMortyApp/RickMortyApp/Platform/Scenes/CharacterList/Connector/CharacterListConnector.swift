//
//  CharacterListConnector.swift
//  RickMortyApp
//
//  Created by Héctor Rogel on 25/11/22.
//

import Foundation
import UIKit

class CharacterListConnector {

    // MARK: - Init
    init() {}

    // MARK: - Dependency injection
    func assembleModule() -> UIViewController {
        let entityGateway = CharactersRepository(network: CharactersNetwork())
        let useCaseFactory = CharactersUseCaseFactory(charactersGateway: entityGateway)
        let viewModel = CharacterListViewModel(useCaseFactory: useCaseFactory)
        let viewController = CharacterListViewController(viewModel: viewModel)
        return viewController
    }
}
