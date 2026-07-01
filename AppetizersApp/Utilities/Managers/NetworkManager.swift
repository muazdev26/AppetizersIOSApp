//
//  NetworkManager.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 19/08/2025.
//

import UIKit

actor NetworkManager {

    static let shared = NetworkManager()

    private let cache = NSCache<NSString, UIImage>()

    private static let baseURL =
        "https://api.jsonbin.io/v3/b/68a328d343b1c97be9218dfb"

    private init() {}

    func getAppetizers() async throws -> [Appetizer] {

        guard let url = URL(string: Self.baseURL) else {
            throw APError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            let response = try JSONDecoder().decode(AppetizerDTO.self, from: data)
            return response.record.request
        } catch {
            throw APError.invalidData
        }
    }

    
    func downloadImage(from urlString: String) async throws -> UIImage {

        let cacheKey = NSString(string: urlString)

        // Check cache first
        if let cachedImage = cache.object(forKey: cacheKey) {
            return cachedImage
        }

        guard let url = URL(string: urlString) else {
            throw APError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        guard let image = UIImage(data: data) else {
            throw APError.invalidData
        }

        cache.setObject(image, forKey: cacheKey)

        return image
    }
}
