

import UIKit
import Alamofire

class ViewController: UIViewController {

    var model = [ParametrCard]()
    var searchActionHandler: ((String) -> Void)?

    private lazy var seachBar: UISearchBar = {
        let seach = UISearchBar()
        seach.placeholder = "Поиск"
        seach.keyboardType = .webSearch
        seach.searchBarStyle = .minimal
        seach.delegate = self
        seach.translatesAutoresizingMaskIntoConstraints = false
        return seach
    }()

    private lazy var buttonSeach: UIButton = {
        let button = UIButton()
        button.setTitle("Найти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

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
           view.addSubview(seachBar)
           view.addSubview(buttonSeach)
           view.addSubview(tableView)
       }

       private func setupLayout () {
           NSLayoutConstraint.activate([
            seachBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            seachBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            seachBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            seachBar.heightAnchor.constraint(equalToConstant: 60),

            buttonSeach.topAnchor.constraint(equalTo: seachBar.bottomAnchor, constant: 20),
            buttonSeach.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSeach.widthAnchor.constraint(equalToConstant: 100),
            buttonSeach.heightAnchor.constraint(equalToConstant: 40),

               tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: buttonSeach.bottomAnchor, constant: 20),
               tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
           ])
       }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func fetchCard() {
        NetworkManager.shared.fetchCard { [weak self] cards in
            if let cards = cards {
                self?.model = cards
                self?.tableView.reloadData()
            } else {
                self?.showAlert(message: "Не удалось получить данные")
            }
        }
    }

    func seachForCard(searchText: String) {
        guard searchText.isEmpty else {
            fetchCard()
            return
        }

        let filter = model.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        self.model = filter
        tableView.reloadData()
    }

    func setupSearchHandler() {
        searchActionHandler = { [weak self] searchText in
            self?.seachForCard(searchText: searchText)
        }
    }

@objc
    func buttonTapped() {
        guard let seachText = seachBar.text, seachText.isEmpty else {
            showAlert(message: "Введите запрос по картам")
            return
        }
        searchActionHandler?(seachText)
        view.endEditing(true)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let card = model[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Cell
        else { return UITableViewCell() }
        cell.model = card
        return cell
    }

//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            model.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let modelData = model[indexPath.row]
        let viewController = DetailView()
        viewController.model = modelData
        navigationController?.pushViewController(viewController, animated: true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        seachForCard(searchText: searchText)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        fetchCard()
    }
}

