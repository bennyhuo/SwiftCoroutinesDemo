//
// Created by benny on 2021/9/19.
//

import Foundation
import SwiftUI

struct UserDetails: View {

    let userItem: UserItem

    var body: some View {
        VStack {
            Image(uiImage: userItem.image)
            Text(userItem.user.login).font(.title)
        }
    }

}
