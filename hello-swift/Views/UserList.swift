//
// Created by benny on 2021/9/19.
//

import Foundation
import SwiftUI

class UserItem: Identifiable, ObservableObject {
    let user: User
    @Published var image: UIImage = UIImage()

    var id: Int64 {
        get {
            user.id
        }
    }

    init(user: User) {
        self.user = user
    }
}

struct UserList: View {

    let userItems: [UserItem]

    init(users: [User]) {
        self.userItems = users.map {
            UserItem(user: $0)
        }
    }

    var body: some View {
        NavigationView {
            List(userItems) { userItem in
                NavigationLink(destination: UserDetails(userItem: userItem)) {
                    UserRow(userItem: userItem)
                }
            }.navigationBarTitle("My followers")
        }.navigationViewStyle(StackNavigationViewStyle())
    }

}
