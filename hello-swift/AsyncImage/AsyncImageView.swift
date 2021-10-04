//
// Created by benny on 2021/9/19.
//

import Foundation
import SwiftUI

struct AsyncImageView: View {
    var urlString: String
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()

    var body: some View {
        Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .onAppear {
                    imageLoader.loadImage(for: urlString)
                }
    }
}