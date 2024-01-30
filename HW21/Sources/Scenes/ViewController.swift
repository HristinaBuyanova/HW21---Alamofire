//
//  ViewController.swift
//  HW21
//
//  Created by Христина Буянова on 29.01.2024.
//

import UIKit

class ViewController: UIViewController {

    var model = [ParametrCard]()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierrarchy()
        setupLayout()
    }

    // MARK: - Setup
       private func setupView() {
           view.backgroundColor = .white
           navigationItem.title = "Magic Cards"
           navigationController?.navigationBar.prefersLargeTitles = true
       }

       private func setupHierrarchy () {
           view.addSubview(tableView)
       }

       private func setupLayout () {
           NSLayoutConstraint.activate([
               tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
           ])
       }



}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let card = model[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Cell
        else { return UITableViewCell() }

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let modelData = model[indexPath.row]
        let viewController = DetailView()
        viewController.configureView(model: modelData)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

