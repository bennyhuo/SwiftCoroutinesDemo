//
// Created by benny on 2021/9/19.
//

import Foundation
import SwiftUI

struct UserRow: View {
    @ObservedObject var userItem: UserItem

    var body: some View {
        HStack {
            Image(uiImage: userItem.image).resizable().frame(width: 50, height: 50)
            .onAppear {
                GitHubApi.getImageData(url: userItem.user.avatar_url,
                        onSuccess: { data in
                            userItem.image = UIImage(data: data) ?? UIImage(imageLiteralResourceName: "DefaultAvatar")
                        }, onError: { error in
                    userItem.image = UIImage(imageLiteralResourceName: "DefaultAvatar")
                })
            }
            Text(userItem.user.login)
            Spacer()
        }
    }
}