//
//  ServerSelectionViewController.swift
//  DigitalBank
//
//  Created by &&TairoV on 27.04.2023.
//  Copyright © 2023 iosDeveloper. All rights reserved.
//

import UIKit

public let serverKey = "selectedServer"

public enum AppServer: String, CaseIterable {
    
    case alpha, beta, epsilon, kappa, omicron, tau, api, delta, gamma, lambda, sigma
    
    public var url: String {
        switch self {
        case .alpha:
            return "alpha.digital-t.berekebank.kz"
        case .beta:
            return "beta.digital-t.berekebank.kz"
        case .epsilon:
            return "epsilon.digital-t.berekebank.kz"
        case .kappa:
            return "kappa.digital-t.berekebank.kz"
        case .omicron:
            return "omicron.digital-t.berekebank.kz"
        case .tau:
            return "tau.digital-t.berekebank.kz"
        case .api:
            return "api.digital-t.berekebank.kz"
        case .delta:
            return "delta.digital-t.berekebank.kz"
        case .gamma:
            return "gamma.digital-t.berekebank.kz"
        case .lambda:
            return "lambda.digital-t.berekebank.kz"
        case .sigma:
            return "sigma.digital-t.berekebank.kz"
        }
    }
}

public class ServerSelectionViewController: UIViewController {
    
    private let servers: [AppServer] = AppServer.allCases
    private let selectedServer = UILabel()
    
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    
    private var saveButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.setTitle("Сохранить", for: .normal)
        button.backgroundColor = .green
        return button
    }()
    
    public override func viewDidLoad() {
        
        view.backgroundColor = .white
        selectedServer.text = UserDefaults.standard.string(forKey: sereverKey)
        setupUI()
        addActions()
    }
    
    private func setupUI() {
        view.addSubview(pickerView)
        view.addSubview(selectedServer)
        view.addSubview(saveButton)
        
        var layoutConstraints = [NSLayoutConstraint]()
        
        selectedServer.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            selectedServer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            selectedServer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            selectedServer.bottomAnchor.constraint(equalTo: pickerView.topAnchor, constant: 32)
        ]
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            saveButton.heightAnchor.constraint(equalToConstant: 48),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32)
        ]
        
        NSLayoutConstraint.activate(layoutConstraints)
        
    }
    
    private func addActions() {
        saveButton.addTarget(self, action: #selector(saveStend), for: .touchUpInside)
    }
    
    @objc private func saveStend() {
        let selectedRow = pickerView.selectedRow(inComponent: 1)
        selectedServer.text = UserDefaults.standard.string(forKey: serverKey)
        UserDefaults.standard.set(servers[selectedRow].rawValue, forKey: serverKey)
    }
}

extension ServerSelectionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return servers.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return servers[row].rawValue
    }
}

