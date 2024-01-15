import Foundation

struct Profile {
    let username: String
    let name: String
    let loginName: String
    let bio: String?
    
    init(decodedData: ProfileResult) {
        self.username = decodedData.userLogin
        self.name = ("\(decodedData.firstName) \(decodedData.lastName)")
        self.loginName = "@\(decodedData.userLogin)"
        self.bio = decodedData.bio
    }
}

struct ProfileResult: Codable {
    let userLogin: String
    let firstName: String?
    let lastName: String?
    let bio: String?
    
    private enum CodingKeys: String, CodingKey {
        case userLogin = "username"
        case firstName = "first_name"
        case lastName = "last_name"
        case bio
    }
}
