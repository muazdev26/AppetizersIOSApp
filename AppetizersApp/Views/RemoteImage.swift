//
//  RemoteImage.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 27/08/2025.
//

import SwiftUI

@MainActor
final class ImageLoader: ObservableObject {

    @Published var image: Image? = nil

    func load(fromUrlString urlString: String) {

        Task {
            do {
                let uiImage = try await NetworkManager.shared.downloadImage(
                    from: urlString
                )

                self.image = Image(uiImage: uiImage)

            } catch {
                self.image = nil
                print("Image loading error:", error)
            }
        }
    }
}

struct RemoteImage: View {

    var image: Image?

    var body: some View {
        image?
            .resizable()
        ?? Image("food-placeholder")
            .resizable()
    }
}

struct AppetizerRemoteImage: View {

    @StateObject private var imageLoader = ImageLoader()
    let urlString: String

    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromUrlString: urlString)
            }
    }
}
