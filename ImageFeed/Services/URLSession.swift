import Foundation

extension URLSession {
    func objectTask<T: Decodable>(for request: URLRequest, complition: @escaping (Result<T, Error>) -> Void) -> URLSessionTask {
        let task = dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    complition(.failure(error))
                    return
                }
                
                if let response = response as? HTTPURLResponse, 
                    !(200...299).contains(response.statusCode) {
                    complition(.failure(NetworkError.codeError))
                    return
                }
                
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        complition(.success(decodedData))
                    } catch let error {
                        complition(.failure(error))
                    }
                } else {
                    return
                }
            }
        }
        return task
    }
}
