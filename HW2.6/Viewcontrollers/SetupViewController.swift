//
//  ViewController.swift
//  HW2.2.1
//
//  Created by Игорь Зигура on 24.08.2020.
//  Copyright © 2020 Zigura. All rights reserved.
//

import UIKit

protocol ViewColorProtocol {
    var viewColor: CGColor { get }
}

class SetupViewController: UIViewController, ViewColorProtocol {

    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redTextbox: UITextField!
    @IBOutlet weak var greenTextbox: UITextField!
    @IBOutlet weak var blueTextbox: UITextField!
    
    var delegate: ViewColorDelegate!
    
    var viewColor: CGColor { colorView.layer.backgroundColor! }
    
    var receivedColor: CGColor!
    
    func setColorValuesToLabelsAndTextboxes() {
        let redStringValue = String(round(redSlider.value * 100) / 100)
        let greenStringValue = String(round(greenSlider.value * 100) / 100)
        let blueStringValue = String(round(blueSlider.value * 100) / 100)
        
        redLabel.text = redStringValue
        greenLabel.text = greenStringValue
        blueLabel.text = blueStringValue
        
        redTextbox.text = redStringValue
        greenTextbox.text = greenStringValue
        blueTextbox.text = blueStringValue
    }
    
    func setColor() {
        colorView.layer.backgroundColor = CGColor(srgbRed: CGFloat(redSlider.value),
                                                  green: CGFloat(greenSlider.value),
                                                  blue: CGFloat(blueSlider.value),
                                                  alpha: 1)
        setColorValuesToLabelsAndTextboxes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.backgroundColor = receivedColor
        redSlider.value = Float(receivedColor.components![0])
        greenSlider.value = Float(receivedColor.components![1])
        blueSlider.value = Float(receivedColor.components![2])
        setColorValuesToLabelsAndTextboxes()
    }

    @IBAction func changeViewColor() {setColor()}
    
    @IBAction func doneButtonPushed() {
        delegate.setViewColor(viewColor)
        dismiss(animated: true)
    }
 
    @IBAction func textEditingEnd(textBox: UITextField) {
        guard let textFloatValue = (textBox.text as NSString?)?.floatValue else { return }
        switch textBox {
        case redTextbox:
            redSlider.value = textFloatValue
        case greenTextbox:
            greenSlider.value = textFloatValue
        case blueTextbox:
            blueSlider.value = textFloatValue
        default:
            return
        }
        setColor()
    }
}

extension SetupViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("test")
        if textField == redTextbox {
            print("red")
            textField.resignFirstResponder()
            greenTextbox.becomeFirstResponder()
        } else if textField == greenTextbox {
            print("green")
            textField.resignFirstResponder()
            blueTextbox.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}
