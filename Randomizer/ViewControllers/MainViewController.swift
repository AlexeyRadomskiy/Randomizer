//
//  MainViewController.swift
//  Randomizer
//
//  Created by Alexey on 12.03.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewValues(for randomNumber: RandomNumber)
}

class MainViewController: UIViewController {
    
    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    @IBOutlet var randomValueLabel: UILabel!
    
    private var randomNumber = RandomNumber(minimumValue: 0, maximumValue: 100)

    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueLabel.text = String(randomNumber.minimumValue)
        maximumValueLabel.text = String(randomNumber.maximumValue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.randomNumber = randomNumber
        settingsVC.delegate = self
    }
    
    @IBAction func getRandomNumberButtonTapped() {
        randomValueLabel.text = String(randomNumber.getRandom)
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewValues(for randomNumber: RandomNumber) {
        minimumValueLabel.text = String(randomNumber.minimumValue)
        maximumValueLabel.text = String(randomNumber.maximumValue)
        self.randomNumber = randomNumber
    }
}