//
//  NetworkClient.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

public struct NetworkClient: NetworkRequestable {

    private let service: NetworkService

    public init(service: NetworkService = URLSessionService()) {
        self.service = service
    }

    private func decode<T: Decodable>(decodableType: T.Type, data: Data) -> T? {

        do {
            let decoded = try JSONDecoder().decode(decodableType.self, from: data)
            return decoded
        } catch {
            return nil
        }
    }

    private func validateResponse<T: Decodable>(by code: StatusCode,
                                                with data: Data,
                                                decodableType: T.Type,
                                                completion: @escaping (Result<T?, NetworkError>) -> Void) {

        switch code {
        case .ok:
            guard let decodedData = decode(decodableType: decodableType, data: data) else {
                let error = NetworkError(statusCode: 0, type: .failedToDecode)

                completion(.failure(error))
                return
            }

            completion(.success(decodedData))
            return
        default:
            let error = NetworkError(statusCode: code.rawValue)

            completion(.failure(error))
            return
        }
    }

    private func privateRequest<T: Decodable>(request: NSMutableURLRequest,
                                              decodableType: T.Type,
                                              completion: @escaping (Result<T?, NetworkError>) -> Void) {

        service.request(with: request as URLRequest) { data, response, error in

            DispatchQueue.main.async {
                if let serviceError = error as NSError? {
                    let requestError = NetworkError(statusCode: serviceError.code)

                    completion(.failure(requestError))
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    let error = NetworkError(statusCode: 0, type: .badURL)

                    completion(.failure(error))
                    return
                }

                let code = httpResponse.statusCode

                guard let data = data else {
                    let requestError = NetworkError(statusCode: code)

                    completion(.failure(requestError))
                    return
                }

                let statusCode = StatusCode(rawValue: code)

                validateResponse(by: statusCode, with: data, decodableType: decodableType, completion: completion)
            }
        }
    }

    public func request<T: Decodable>(requestBuilder: URLRequestBuilder,
                               responseType: T.Type,
                               completion: @escaping (Result<T?, NetworkError>) -> Void) {

        guard let urlRequest = requestBuilder.createRequest() else {
            completion(.failure(NetworkError(statusCode: 0, type: .badURL)))
            return
        }

        privateRequest(request: urlRequest, decodableType: responseType, completion: completion)
    }
}
