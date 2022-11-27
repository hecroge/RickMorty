//
//  CharacterDetailViewController.swift
//  RickMortyApp
//
//  Created by Héctor Rogel on 25/11/22.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {
    // MARK: - Properties
    let item: CharacterListItemViewModel
    private let characterDetailViewIdentifier = "CharacterDetailView"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    @IBOutlet weak var statusTitleLabel: UILabel!
    @IBOutlet weak var speciesTitleLabel: UILabel!
    @IBOutlet weak var genderTitleLabel: UILabel!
    @IBOutlet weak var originTitleLabel: UILabel!
    @IBOutlet weak var locationTitleLabel: UILabel!
    // MARK: - Init
    init(item: CharacterListItemViewModel) {
        self.item = item
        super.init(nibName: characterDetailViewIdentifier, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewStyle()
        configureView(with: item)
    }

    // MARK: - Style and configuration
    private func configureViewStyle() {
        statusTitleLabel.text = "Characters_Detail_View_Status".localized()
        speciesTitleLabel.text = "CHaracters_Detail_View_Species".localized()
        genderTitleLabel.text = "CHaracters_Detail_View_Gender".localized()
        originTitleLabel.text = "CHaracters_Detail_View_Origin".localized()
        locationTitleLabel.text = "CHaracters_Detail_View_Location".localized()
    }

    // MARK: - Actions
    private func configureView(with character: CharacterListItemViewModel) {
        titleLabel.text = item.name
        guard let imageData = character.image else {
            self.characterImage.image = UIImage(named: "emptyImage")
            return
        }
        characterImage.image = UIImage(data: imageData)
        statusLabel.text = item.status
        speciesLabel.text = item.species
        genderLabel.text = item.gender
        originLabel.text = item.origin
        locationLabel.text = item.location
    }
}
