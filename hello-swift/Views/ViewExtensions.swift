//
// Created by benny on 2021/10/8.
//

import Foundation
import SwiftUI

extension View {
    public func alertYesOrNot<S>(
            _ title: S,
            isPresented: Binding<Bool>
    ) async -> Bool where S: StringProtocol {
        await withCheckedContinuation { (continuation: CheckedContinuation<Bool, Never>) in
            _ = alert(title, isPresented: isPresented) {
                Button("OK") {
                    continuation.resume(returning: true)
                }
                Button("Cancel", role: .cancel) {
                    continuation.resume(returning: false)
                }
            }
        }
    }
}