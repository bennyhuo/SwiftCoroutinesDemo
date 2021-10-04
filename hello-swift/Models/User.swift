//
// Created by benny on 2021/9/19.
//

import Foundation

struct User: Identifiable, Decodable {
    let id: Int64
    let login: String
    let avatar_url: String
}