import Foundation

class OAuth2TokenStorage {
    private let userDefaults = UserDefaults.standard
    
    private enum Keys: String {
        case accessToken
    }
    
    var token: String? {
        get {
            userDefaults.string(forKey: Keys.accessToken.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Keys.accessToken.rawValue)
        }
    }
}
