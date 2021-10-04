//
//  ContentView.swift
//  hello-swift
//
//  Created by benny on 2021/9/4.
//

import SwiftUI

struct ContentView: View {

    @State var error: Error? = nil
    @State var users: [User] = []

    var body: some View {
        VStack {
            if let error = self.error {
                Text(error.localizedDescription)
            } else if !users.isEmpty {
                UserList(users: users)
            } else {
                Button("Load Followers") {
                    GitHubApi.listFollowers(
                            for: "bennyhuo",
                            onSuccess: { users in
                                debugPrint(users)
                                print("thread: \(Thread.current)")
                                self.users = users
                            },
                            onError: { error in
                                debugPrint(error)
                                print("thread: \(Thread.current)")
                                self.error = error
                            }
                    )


                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


