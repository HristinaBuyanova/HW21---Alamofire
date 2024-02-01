//
//  Cell.swift
//  HW21
//
//  Created by Христина Буянова on 29.01.2024.
//

import UIKit

class Cell: UITableViewCell {

    static let identifier = "cell"

    var model: ParametrCard? {
           didSet {
               nameLabel.text = model?.name
               artistLabel.text = model?.artist
           }
       }

   //    MARK: - UI

       private lazy var nameLabel: UILabel = {
           let label = UILabel()
           label.font = .systemFont(ofSize: 16)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()

       private lazy var artistLabel: UILabel = {
           let label = UILabel()
           label.font = .systemFont(ofSize: 16)
           label.textColor = .systemGray2
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()

    private lazy var imageChevron: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = .darkGray
        imageView.image = UIImage(systemName: "chevron.right")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()

       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setupHierarchy()
           setupLayout()
       }

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

       private func setupHierarchy() {
           addSubview(nameLabel)
           addSubview(artistLabel)
           addSubview(imageChevron)
       }

       private func setupLayout() {
           NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            artistLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            artistLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            imageChevron.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageChevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageChevron.heightAnchor.constraint(equalToConstant: 30),
            imageChevron.widthAnchor.constraint(equalToConstant: 30)
           ])
       }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.model = nil
    }

}
