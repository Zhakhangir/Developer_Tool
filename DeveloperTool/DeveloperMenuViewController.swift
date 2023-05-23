//
//  DeveloperMenuViewController.swift
//  Developer Tool
//
//  Created by &&TairoV on 22.05.2023.
//

import UIKit

class DeveloperMenuViewController: UIViewController {
    
    private let tableView = UITableView()
    private var models: [IDevMenuItem]
    
    init(items: [IDevMenuItem]) {
        self.models = items
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        tableView.reloadData()
    }
    
    func embedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    
    private func setupUI() {
        configureNavigation()
        view.backgroundColor = .white
        configureTableView()
    }
    
    private func configureNavigation() {
        title = "Меню отладки"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "закрыть",
                                                            style: .plain,
                                                            target: self,
                                                            action:#selector(close))
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuItemCell")
        tableView.backgroundColor = .clear
        tableView.dataSource =  self
        tableView.delegate = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc private func close() {
        dismiss(animated: true)
    }
}

extension DeveloperMenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = models[indexPath.row].action()
        vc.title =  models[indexPath.row].title
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
