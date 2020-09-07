//
//  ColorViewController.swift
//  HW2.6
//
//  Created by Игорь Зигура on 06.09.2020.
//  Copyright © 2020 Zigura. All rights reserved.
//

import UIKit

protocol ViewColorDelegate {
    func setViewColor(_ viewColor: CGColor)
}

class ColorViewController: UIViewController {
    
    @IBOutlet var MainColorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainColorView.layer.backgroundColor = CGColor(srgbRed: 1,
                                                      green: 1,
                                                      blue: 1,
                                                      alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openSetupView" {
            guard let setViewColorVC = segue.destination as? SetupViewController else { return }
            setViewColorVC.delegate = self
            setViewColorVC.receivedColor = MainColorView.layer.backgroundColor
        }
    }
}

extension ColorViewController: ViewColorDelegate {
    func setViewColor(_ viewColor: CGColor) {
        MainColorView.layer.backgroundColor = viewColor
    }
}
