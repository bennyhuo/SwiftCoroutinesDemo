//
// Created by benny on 2021/9/19.
//

import Foundation
import Alamofire

extension DataRequest {

    func responseDecodableAsync<T: Decodable>(of type: T.Type = T.self,
                                              queue: DispatchQueue = .main,
                                              dataPreprocessor: DataPreprocessor = DecodableResponseSerializer<T>.defaultDataPreprocessor,
                                              decoder: DataDecoder = JSONDecoder(),
                                              emptyResponseCodes: Set<Int> = DecodableResponseSerializer<T>.defaultEmptyResponseCodes,
                                              emptyRequestMethods: Set<HTTPMethod> = DecodableResponseSerializer<T>.defaultEmptyRequestMethods) async throws -> T {

        try await withCheckedThrowingContinuation { continuation in
            self.responseDecodable(
                    of: type,
                    queue: queue,
                    dataPreprocessor: dataPreprocessor,
                    decoder: decoder,
                    emptyResponseCodes: emptyResponseCodes,
                    emptyRequestMethods: emptyRequestMethods
            ) { response in
                switch response.result {
                case .success(let decodedResponse):
                    continuation.resume(returning: decodedResponse)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func responseDataAsync(queue: DispatchQueue = .main,
                           dataPreprocessor: DataPreprocessor = DataResponseSerializer.defaultDataPreprocessor,
                           emptyResponseCodes: Set<Int> = DataResponseSerializer.defaultEmptyResponseCodes,
                           emptyRequestMethods: Set<HTTPMethod> = DataResponseSerializer.defaultEmptyRequestMethods) async throws -> Data {
        try await withCheckedThrowingContinuation { continuation in
            responseData(
                    queue: queue,
                    dataPreprocessor: dataPreprocessor,
                    emptyResponseCodes: emptyResponseCodes, emptyRequestMethods: emptyRequestMethods
            ) { response in
                switch response.result {
                case .success(let data): continuation.resume(returning: data)
                case .failure(let error): continuation.resume(throwing: error)
                }
            }
        }
    }

}
