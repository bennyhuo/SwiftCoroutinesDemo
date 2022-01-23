//
// Created by benny on 2021/10/10.
//

import Foundation

func hello() async -> Int {
    1
}

func helloAsync(onComplete: @escaping (Int) -> Void) {
    Thread {
        onComplete(1)
    }.start()
}