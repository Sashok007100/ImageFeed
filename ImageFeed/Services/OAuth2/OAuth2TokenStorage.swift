import Foundation

final class OAuth2TokenStorage {
    static let shared = OAuth2TokenStorage()
    
    private let userDefaults = UserDefaults.standard
    
    private enum Keys: String {
        case token
    }
    
    private let tokenKey = "BearerToken"
    
    var token: String? {
        get {
            userDefaults.string(forKey: tokenKey)
        }
        set {
            userDefaults.set(newValue, forKey: tokenKey)
        }
    }
}
