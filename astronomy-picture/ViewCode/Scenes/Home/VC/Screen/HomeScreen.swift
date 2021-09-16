//
//  DetailTableViewCell.swift
//  ViewCode
//
//  Created by Gabriela Sillis on 31/08/21.
//

import UIKit
import  SDWebImage

class HomeScreen: UIView {

    lazy private var astronomyImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.setupBorderImage(borderColor: UIColor.customRed.cgColor)

        return image
    }()

    lazy private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .customRed
        label.numberOfLines = 0
        return label
    }()

    lazy private var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.numberOfLines = 0

        return label
    }()

    lazy private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isScrollEnabled = true

        return scroll
    }()

    lazy private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubview()
        self.configBackground()
        self.configConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public  func config(with: AstronomyPicture) {
        self.astronomyImage.sd_setImage(with: URL(string: with.href ?? ""))
        self.nameLabel.text = with.title
        self.detailLabel.text = with.explanation
    }

    private func configSubview() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.astronomyImage)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.detailLabel)
    }

    private func configBackground() {
        self.backgroundColor = .black
    }

    // MARK: - configConstraints
    private func configConstraints() {
        NSLayoutConstraint.activate([

            // MARK: - scrollview

            self.scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            self.scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),

            // MARK: - contentView

            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),

            // MARK: - astronomyImage
            self.astronomyImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            self.astronomyImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 40),
            self.astronomyImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -40),
            self.astronomyImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),

            self.astronomyImage.heightAnchor.constraint(equalToConstant: 500),

            // MARK: - nameLabel
            self.nameLabel.topAnchor.constraint(equalTo: self.astronomyImage.bottomAnchor, constant: 20),
            self.nameLabel.centerXAnchor.constraint(equalTo: self.astronomyImage.centerXAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.astronomyImage.leadingAnchor),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.astronomyImage.trailingAnchor),

            // MARK: - detailLabel
            self.detailLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 20),
            self.detailLabel.centerXAnchor.constraint(equalTo: self.astronomyImage.centerXAnchor),
            self.detailLabel.leadingAnchor.constraint(equalTo: self.astronomyImage.leadingAnchor),
            self.detailLabel.trailingAnchor.constraint(equalTo: self.astronomyImage.trailingAnchor),
            self.detailLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10)
        ])
    }
}

