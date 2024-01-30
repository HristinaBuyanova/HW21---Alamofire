
import UIKit

final class DetailView: UIViewController {

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
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
            view.addSubview(textLabel)
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

                textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),

                artistLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                artistLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10),

                idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                idLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 10),
            ])
        }

    func configureView(model: ParametrCard) {
        nameLabel.text =  model.name
        typeLabel.text = model.type
        cmcLabel.text = String(model.cmc)
        rarityLabel.text = model.rarity
        textLabel.text = model.text
        artistLabel.text = model.artist
        idLabel.text = model.id

        
        }

}
