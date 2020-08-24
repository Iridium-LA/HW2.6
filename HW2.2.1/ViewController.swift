//
//  ViewController.swift
//  HW2.2.1
//
//  Created by Игорь Зигура on 24.08.2020.
//  Copyright © 2020 Zigura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorView: UIView!
    
    func sliderMove() {
        colorView.layer.backgroundColor = CGColor(srgbRed: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        redLabel.text = String(round(redSlider.value * 100) / 100)
        greenLabel.text = String(round(greenSlider.value * 100) / 100)
        blueLabel.text = String(round(blueSlider.value * 100) / 100)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func redSliderMove() {sliderMove()}
    @IBAction func greenSliderMove() {sliderMove()}
    @IBAction func blueSliderMove() {sliderMove()}
    
}

