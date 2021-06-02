//
//  ViewController.swift
//  Conversores
//
//  Created by MAC on 28/05/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtValue: UITextField!
    @IBOutlet weak var btnUnit1: UIButton!
    @IBOutlet weak var btnUnit2: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblResultUnit: UILabel!
    @IBOutlet weak var lblUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: SHOW NEXT MEASUREMENT
    @IBAction func showNext(_ sender: UIButton) {
//        print("lbltext", getlblText())
        let texts = getlblText()
        
        lblUnit.text = texts[0] as? String
        btnUnit1.setTitle((texts[1] as? String), for: .normal)
        btnUnit2.setTitle((texts[2] as? String), for: .normal)
        
        convert(nil)
    }
    
    //MARK: GET TEXT FOR THE MAIN LABEL
    func getlblText() -> Array<Any>{
        let text: String
        let title1: String
        let title2: String
        
        switch lblUnit.text! {
            case "TEMPERATURA":
                text = "PESO"
                title1 = "KILOGRAMA"
                title2 = "LIBRA"
            case "PESO":
                text = "MOEDA"
                title1 = "REAL"
                title2 = "DOLAR"
            case "MOEDA":
                text = "DISTANCIA"
                title1 = "METRO"
                title2 = "KM"
            default:
                text = "TEMPERATURA"
                title1 = "CELSIUS"
                title2 = "FARENHEINT"
        }
        
        return [text, title1, title2]
    }
    
    //MARK: CALL THE FUNCTION THAT WILL CALCULATE
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btnUnit1 {
                btnUnit2.alpha = 0.5
                btnUnit1.alpha = 1.0
            }else{
                btnUnit1.alpha = 0.5
                btnUnit2.alpha = 1.0
            }

            lblResultUnit.text = sender.currentTitle!
            
            switch lblUnit.text! {
                case "TEMPERATURA":
                    calcTemperature()
                case "PESO":
                    calcWeight()
                case "MOEDA":
                    calcCurrency()
                default:
                    calcDistancy()
            }
            
            view.endEditing(true)
            
            if let result = Double(lblResult.text!) {
                lblResult.text = String(format:"%.2f", result)
            }
        }
    }
    
    //MARK: CALCULATE TEMPERATURE
    func calcTemperature(){
        guard let temperature = Double(txtValue.text!) else { return }
        
        if btnUnit1.alpha == 1.0 {
            lblResult.text = (String((temperature * 1.8) + 32.00))
        }else{
            lblResult.text = (String((temperature - 32.00) / 1.8))
        }
    }
    
    //MARK: CALCULATE WEIGHT
    func calcWeight(){
        guard let weight = Double(txtValue.text!) else { return }
        
        if btnUnit1.alpha == 1.0 {
            lblResult.text = (String(weight / 2.2046))
        }else{
            lblResult.text = (String(weight * 2.2046))
        }
    }
    
    //MARK: CALCULATE CURRENCY
    func calcCurrency(){
        guard let currency = Double(txtValue.text!) else { return }

        if btnUnit1.alpha == 1.0 {
            lblResult.text = (String(currency / 6))
        }else{
            lblResult.text = (String(currency * 6))
        }
    }
    
    //MARK: CALCULATE DISTANCY
    func calcDistancy(){
        guard let distancy = Double(txtValue.text!) else { return }
        
        if btnUnit1.alpha == 1.0 {
            lblResult.text = (String(distancy / 1000))
        }else{
            lblResult.text = (String(distancy * 1000))
        }
    }
    
    //MARK: FUNCTION OF DEBUG
    func printInfo(_ value: Any) {
        let t = type(of: value)
        print("'\(value)' of type '\(t)'")
    }
}

