//
//  ViewController.swift
//  FirstAppAcessibility
//
//  Created by Felipe Hoffmann on 22/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var screen: ViewControllerScreen?
    
    override func loadView() {
        screen = ViewControllerScreen()
        view = screen
        
        screen?.delegate(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configAccessibility()
    }
    
    private func configAccessibility() {
        screen?.positionOneLabel.isAccessibilityElement = true
        screen?.positionTwoLabel.isAccessibilityElement = false
        screen?.positionThreeLabel.isAccessibilityElement = false
        screen?.positionFourLabel.isAccessibilityElement = false
        screen?.positionFiveLabel.isAccessibilityElement = false
        screen?.titleLabel.isAccessibilityElement = false
        screen?.loginButton.isAccessibilityElement = false
        screen?.personImageView.isAccessibilityElement = true
        
        screen?.positionOneLabel.accessibilityLabel = "Posição um"
        screen?.positionTwoLabel.accessibilityLabel = "Posição dois"
        screen?.positionThreeLabel.accessibilityLabel = "Posição três"
        screen?.positionFourLabel.accessibilityLabel = "Posição quatro"
        screen?.positionFiveLabel.accessibilityLabel = "Posição cinco"
        screen?.personImageView.accessibilityLabel = "Imagem de uma pessoa"
        
        screen?.positionOneLabel.accessibilityTraits = .staticText // Já é o padrão para label
        screen?.positionTwoLabel.accessibilityTraits = .staticText
        screen?.positionThreeLabel.accessibilityTraits = .staticText
        screen?.positionFourLabel.accessibilityTraits = .staticText
        screen?.positionFiveLabel.accessibilityTraits = .staticText
        screen?.personImageView.accessibilityTraits = .image
        
        screen?.titleLabel.accessibilityTraits = .header
        screen?.loginButton.accessibilityTraits = .button
        
        guard let first = screen?.positionOneLabel,
              let second = screen?.positionTwoLabel,
              let three = screen?.positionThreeLabel,
              let four = screen?.positionFourLabel,
              let five = screen?.positionFiveLabel,
              let button = screen?.loginButton,
              let title = screen?.titleLabel,
              let image = screen?.personImageView else { return }
        
        // Coloca os elementos em ordem
        view.accessibilityElements = [image, first, second, three, four, five, button, title]
    }
}

extension ViewController: ViewControllerScreenProtocol {
    func tappedLoginButton() {
//        UIAccessibility.post(notification: .announcement, argument: "Teste o botão foi pressionado")
        UIAccessibility.post(notification: .screenChanged, argument: screen?.positionOneLabel)
    }
}
