import UIKit

final class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    private func createUI() {
        //MARK: - UIImageView()
        let avatarImageView = UIImageView()
        view.addSubview(avatarImageView)
        avatarImageView.image = UIImage(named: "Photo")
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - UIBUtton()
        let logoutButton = UIButton.systemButton(
            with: UIImage(named: "Exit")!,
            target: self,
            action: #selector(self.didTapLogoutButton)
        )
        view.addSubview(logoutButton)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.tintColor = .ypRed
        
        //MARK: - nameLabel
        let nameLabel = UILabel()
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Екатерина Новикова"
        nameLabel.textColor = .ypWhite
        nameLabel.font = UIFont.boldSystemFont(ofSize: 23)
        
        //MARK: - loginNameLabel
        let loginNameLabel = UILabel()
        view.addSubview(loginNameLabel)
        loginNameLabel.translatesAutoresizingMaskIntoConstraints = false
        loginNameLabel.text = "@ekaterina_nov"
        loginNameLabel.textColor = .ypGray
        loginNameLabel.font = UIFont.systemFont(ofSize: 13)
        
        //MARK: - descriptionLabel
        let descriptionLabel = UILabel()
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Hello, world!"
        descriptionLabel.textColor = .ypWhite
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        
        //MARK: - Constraints
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 70),
            avatarImageView.heightAnchor.constraint(equalToConstant: 70),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logoutButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 8),
            loginNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            loginNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: loginNameLabel.bottomAnchor, constant: 8)
        ])
    }
    
    @objc
    private func didTapLogoutButton() {
        print("Есть нажатие!")
    }
}
