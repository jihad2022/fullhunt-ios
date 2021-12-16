//
//  ServiceManager.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import Foundation

protocol ServiceManagerProtocol: AnyObject {
    func makeNetworkRequest<T: Decodable>(
        router: Router,
        completion: @escaping (Result<T, FullHuntError>) -> Void
    )
}

final class ServiceManager: ServiceManagerProtocol {
    
    func makeNetworkRequest<T>(
        router: Router,
        completion: @escaping (Result<T, FullHuntError>) -> Void
    ) where T: Decodable {
        
        guard let request = router.request else {
            handleFullHuntError(error: .requestNotFound, completion: completion)
            return
        }
        
        router.session.dataTask(with: request) { [weak self] (data, response, error) in
            if let error = error {
                self?.handleError(error: error, completion: completion)
            }
            
            guard let response = response as? HTTPURLResponse, let data = data else {
                self?.handleFullHuntError(error: .badResponse, completion: completion)
                return
            }

            let statusCode = response.statusCode
            switch statusCode {
            case 200:
                self?.handleSuccess(data: data, completion: completion)
            case 400:
                self?.handleFullHuntError(error: .badRequest, completion: completion)
            case 401:
                self?.handleFullHuntError(error: .unauthorized, completion: completion)
            case 403:
                self?.handleFullHuntError(error: .forbidden, completion: completion)
            case 404:
                self?.handleFullHuntError(error: .notFount, completion: completion)
            case 429:
                self?.handleFullHuntError(error: .tooManyRequests, completion: completion)
            default:
                self?.handleFullHuntError(
                    error: FullHuntError.generic(
                        code: 1001,
                        description: "Unknown error has occured."
                    ),
                    completion: completion
                )
            }
        }
        .resume()
    }
}

private extension ServiceManager {
    func handleError<T: Decodable>(
        error: Error,
        completion: @escaping (Result<T, FullHuntError>) -> Void
    ) {
        let nsError = error as NSError
        DispatchQueue.main.async {
            completion(
                .failure(
                    .generic(
                        code: nsError.code,
                        description: nsError.localizedDescription
                    )
                )
            )
        }
    }
    
    func handleFullHuntError<T: Decodable>(
        error: FullHuntError,
        completion: @escaping (Result<T, FullHuntError>) -> Void
    ) {
        DispatchQueue.main.async {
            completion(.failure(error))
        }
    }
    
    func handleSuccess<T: Decodable>(
        data: Data,
        completion: @escaping (Result<T, FullHuntError>) -> Void
    ) {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            DispatchQueue.main.async {
                completion(.success(decodedData))
            }
        } catch {
            handleError(error: error, completion: completion)
        }
    }
}
