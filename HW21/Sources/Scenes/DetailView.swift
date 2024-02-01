
import UIKit

final class DetailView: UIViewController {

    var model: ParametrCard? {
        didSet {
            nameLabel.text = model?.name
            typeLabel.text = "Тип: " + (model?.type ?? "")
            cmcLabel.text = "Манная стоимость: \(model?.cmc ?? 0)"
            rarityLabel.text = model?.rarity
            artistLabel.text = "Автор: " + (model?.artist ?? "")
            idLabel.text = "ID: " + (model?.id ?? "")

            guard let imagePath = model?.imageURL else {
                imageView.image = UIImage(named: "нет карты")
                return
            }
            ImageLoad.shared.loadImage(from: imagePath) { result in
                switch result {
                case .success(let data):
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    }
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                }
            }
        }
    }

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var cmcLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var rarityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    private func setupView() {
        view.backgroundColor = .white
        }

        private func setupHierarchy() {
            view.addSubview(nameLabel)
            view.addSubview(typeLabel)
            view.addSubview(cmcLabel)
            view.addSubview(rarityLabel)
            view.addSubview(imageView)
            view.addSubview(artistLabel)
            view.addSubview(idLabel)
        }

    private func setupLayout() {
            NSLayoutConstraint.activate([
                nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                typeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),

                cmcLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                cmcLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),

                rarityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                rarityLabel.topAnchor.constraint(equalTo: cmcLabel.bottomAnchor, constant: 10),

                imageView.topAnchor.constraint(equalTo: rarityLabel.bottomAnchor, constant: 20),
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 300),
                imageView.heightAnchor.constraint(equalToConstant: 400),

                artistLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                artistLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),

                idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                idLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 10),
            ])
        }
}
