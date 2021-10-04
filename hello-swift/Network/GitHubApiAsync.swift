//
// Created by benny on 2021/9/19.
//

import Foundation
import Alamofire

class GitHubApiAsync {

    static func listFollowers(for userName: String,
                       onSuccess: @escaping ([User]) -> Void,
                       onError: @escaping (Error) -> Void) async throws -> [User] {
        try await AF.request("\(GITHUB_API_ENDPOINT)/users/\(userName)/followers").responseDecodableAsync()
    }

    static func getImageData(url: String) async throws -> Data{
        try await AF.request(url).responseDataAsync()
    }

}
