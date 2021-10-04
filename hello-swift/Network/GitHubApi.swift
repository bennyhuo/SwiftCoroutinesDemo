//
// Created by benny on 2021/9/19.
//

import Foundation
import Alamofire

class GitHubApi {

    static func listFollowers(for userName: String,
                       onSuccess: @escaping ([User]) -> Void,
                       onError: @escaping (Error) -> Void) {
        AF.request("\(GITHUB_API_ENDPOINT)/users/\(userName)/followers").responseDecodable(of: [User].self) { response in
            switch response.result {
            case .success(let users):
                onSuccess(users)
            case .failure(let error):
                onError(error)
            }
        }
    }

    static func getImageData(url: String,
                      onSuccess: @escaping (Data) -> Void,
                      onError: @escaping (Error) -> Void) {
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                onSuccess(data)
            case .failure(let error):
                onError(error)
            }
        }
    }

}
