//
//  ViewController.swift
//  Tips-Project
//
//  Created by Sillas Santos on 21/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let textLabel = UILabel()
    private let textFieldPurchaseValue = UITextField()
    private let tipBackView = UIView()
    private let tipLabel = UILabel()
    private let btnCalcTip = UIButton()
    private let textFieldTipValue = UITextField()
    private let pickerTip = UIPickerView()
    
    var calculateTip: CalculateTipProtocol?
    
    let arrPickerTip = ["10", "15", "20"]
    
    init(calculateTip: CalculateTipProtocol? = CalculateTip()) {
        self.calculateTip = calculateTip
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        pickerTip.delegate = self
        pickerTip.dataSource  = self
        textFieldPurchaseValue.delegate = self
        addView()
        configureView()
        addConstraints()
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        tipBackView.layer.cornerRadius = tipBackView.layer.bounds.width / 2
        tipBackView.clipsToBounds = true
    }
    
    func addView(){
        let arr = [textLabel,
                   tipBackView,
                   tipLabel,
                   textFieldPurchaseValue,
                   textFieldTipValue,
                   btnCalcTip]
        
        arr.forEach{ view.addSubview($0) }
        arr.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    func configureView(){
        configureTextLabel()
        configureTipBackView()
        configureTipLabel()
        configurePurchaseValue()
        configureTextFieldTipValue()
        configureBtnCalcTip()
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            textLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80),
            textLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.10),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 100 * 10),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width / 100 * 10)),
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height / 100 * 1),
            
            tipBackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            tipBackView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            tipBackView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: view.frame.width / 100 * 10),
            tipBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 100 * 15),
            tipBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width / 100 * 15)),
            
            tipLabel.centerXAnchor.constraint(equalTo: tipBackView.centerXAnchor),
            tipLabel.centerYAnchor.constraint(equalTo: tipBackView.centerYAnchor),
            tipLabel.widthAnchor.constraint(equalTo: tipBackView.widthAnchor, multiplier: 0.8),
            tipLabel.heightAnchor.constraint(equalTo: tipBackView.heightAnchor, multiplier: 0.3),
            
            textFieldPurchaseValue.topAnchor.constraint(equalTo: tipBackView.bottomAnchor, constant: view.frame.width / 100 * 10),
            textFieldPurchaseValue.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.50),
            textFieldPurchaseValue.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            textFieldPurchaseValue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 100 * 25),
            textFieldPurchaseValue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width / 100 * 25)),
            
            textFieldTipValue.topAnchor.constraint(equalTo: textFieldPurchaseValue.bottomAnchor, constant: view.frame.width / 100 * 5),
            textFieldTipValue.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.50),
            textFieldTipValue.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            textFieldTipValue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 100 * 25),
            textFieldTipValue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width / 100 * 25)),
            
            btnCalcTip.topAnchor.constraint(equalTo: textFieldTipValue.bottomAnchor, constant: view.frame.width / 100 * 5),
            btnCalcTip.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.50),
            btnCalcTip.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            btnCalcTip.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 100 * 25),
            btnCalcTip.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width / 100 * 25)),
        ])
    }
    
    func configureTextLabel(){
        textLabel.backgroundColor = .clear
        textLabel.text = Constants.textLabel
        textLabel.font = .systemFont(ofSize: 30, weight: .regular)
        textLabel.textColor = Constants.textColor
        textLabel.textAlignment = .center
    }
    
    func configureTipLabel(){
        tipLabel.text = "0.0"
        tipLabel.textAlignment = .center
        tipLabel.textColor = .white
        tipLabel.font = .systemFont(ofSize: 30, weight: .regular)
    }
    
    func configureTipBackView() {
        tipBackView.backgroundColor = Constants.backgroundTipView
        tipBackView.layer.borderColor = Constants.colorCyan.cgColor
        tipBackView.layer.borderWidth = 5.0
    }
    
    func configurePurchaseValue(){
        textFieldPurchaseValue.backgroundColor = .white
        textFieldPurchaseValue.placeholder = Constants.purchasePlaceHolder
        textFieldPurchaseValue.textAlignment = .center
        textFieldPurchaseValue.borderStyle = .roundedRect
        textFieldPurchaseValue.layer.borderColor = Constants.textColor.cgColor
        textFieldPurchaseValue.layer.borderWidth = 2.0
        textFieldPurchaseValue.keyboardType = .numbersAndPunctuation
    }
    
    func configureTextFieldTipValue(){
        textFieldTipValue.backgroundColor = .white
        textFieldTipValue.placeholder = Constants.tipValuePlaceHolder
        textFieldTipValue.textAlignment = .center
        textFieldTipValue.borderStyle = .roundedRect
        textFieldTipValue.layer.borderColor = Constants.textColor.cgColor
        textFieldTipValue.layer.borderWidth = 2.0
        textFieldTipValue.inputView = pickerTip
    }
    
    func confifurePickerView(){
        pickerTip.backgroundColor = Constants.backgroundTipView
    }
    
    func configureBtnCalcTip() {
        var configuration = UIButton.Configuration.filled()
        configuration.title = Constants.btnCalcTip
        configuration.background.backgroundColor =  .systemBlue
        configuration.buttonSize = .medium
        btnCalcTip.configuration = configuration
        btnCalcTip.addTarget(self, action: #selector(btnCalc), for: .touchUpInside)
    }
    
    @objc func btnCalc(){
        
        guard let purchaseValue = textFieldPurchaseValue.text, let tipValue = textFieldTipValue.text else { return }
        
        let valueOfTip = calculateTip?.calculateTip(tipValue: Int(tipValue), purchaseValue: Double(purchaseValue))
        
        DispatchQueue.main.async {
            self.tipLabel.text = valueOfTip
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrPickerTip.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrPickerTip[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textFieldTipValue.text = arrPickerTip[row]
        textFieldTipValue.resignFirstResponder()
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return (string.rangeOfCharacter(from: invalidCharacters) == nil)
    }
}
