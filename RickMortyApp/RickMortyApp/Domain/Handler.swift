//
//  Handler.swift
//  RickMortyApp
//
//  Created by Héctor Rogel on 25/11/22.
//

import Foundation

enum DomainError: Error {
    case persistence
    case locationNotAllowed
}

typealias Handler<T> = (Result<T, DomainError>) -> Void
