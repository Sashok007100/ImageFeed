import UIKit

final class ProfileViewController: UIViewController {
    
    private let storageToken = OAuth2TokenStorage()
    private let profileService = ProfileService.shared
    
    private var name: String = ""
    private var loginName: String?
    private var bio: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateProfileInfo()
        createUI(name: name, loginName: loginName, bio: bio)
    }
    
    private func createUI(name: String?, loginName: String?, bio: String?) {
        //MARK: - UIImageView()
        let avatarImageView = UIImageView()
        view.addSubview(avatarImageView)
        avatarImageView.image = UIImage(named: "Photo")
        
        //MARK: - UIBUtton()
        let logoutButton = UIButton.systemButton(
            with: UIImage(named: "Exit")!,
            target: self,
            action: #selector(self.didTapLogoutButton)
        )
        view.addSubview(logoutButton)
        logoutButton.tintColor = .ypRed
        
        //MARK: - nameLabel
        let nameLabel = UILabel()
        view.addSubview(nameLabel)
        nameLabel.text = name ?? "Екатерина Новикова"
        nameLabel.textColor = .ypWhite
        nameLabel.font = UIFont.boldSystemFont(ofSize: 23)
        
        //MARK: - loginNameLabel
        let loginNameLabel = UILabel()
        view.addSubview(loginNameLabel)
        loginNameLabel.text = loginName ?? "@ekaterina_nov"
        loginNameLabel.textColor = .ypGray
        loginNameLabel.font = UIFont.systemFont(ofSize: 13)
        
        //MARK: - descriptionLabel
        let descriptionLabel = UILabel()
        view.addSubview(descriptionLabel)
        descriptionLabel.text = bio ?? "Hello, world!"
        descriptionLabel.textColor = .ypWhite
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        
        [avatarImageView, logoutButton, nameLabel, loginNameLabel, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
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
        
        // Для тестов
        print(name)
        print(loginName)
        print(bio)
    }
    
    @objc
    private func didTapLogoutButton() {
        print("Есть нажатие!")
    }
}

extension ProfileViewController {
    private func updateProfileInfo() {
        guard let profile = profileService.profile else {
            assertionFailure("No saved profile.")
            return
        }
        
        self.name = profile.username
        self.loginName = profile.loginName
        self.bio = profile.bio
    }
}
