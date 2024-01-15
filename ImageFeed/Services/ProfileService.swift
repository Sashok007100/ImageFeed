import Foundation

final class ProfileService {
    static let shared = ProfileService()
    
    private let urlSession = URLSession.shared
    private var task: URLSessionTask?
    private (set) var profile: Profile?
    
    private init(task: URLSessionTask? = nil, profile: Profile? = nil) {
        self.task = task
        self.profile = profile
    }
    
    func fetchProfile(_ token: String, completion: @escaping (Result<Profile, Error>) -> Void) {
        assert(Thread.isMainThread)
        task?.cancel()
        
        let request = makeFetchProfileRequest(token: token)
        let task = urlSession.objectTask(for: request) { [weak self] (result: Result<ProfileResult, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let body):
                let profile = Profile(decodedData: body)
                self.profile = profile
                completion(.success(profile))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        self.task = task
        task.resume()
    }
}

extension ProfileService {
    private func makeFetchProfileRequest(token: String) -> URLRequest {
        guard let url = URL(string: DefaultBaseURL.absoluteString + "/me") else {
            fatalError("Failed to create URL.")
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }
}
