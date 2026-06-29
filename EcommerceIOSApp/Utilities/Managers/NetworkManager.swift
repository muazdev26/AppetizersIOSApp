//
//  NetworkManager.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 19/08/2025.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://api.jsonbin.io/v3/b/68a328d343b1c97be9218dfb"
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: Self.baseURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let responseData = response as? HTTPURLResponse, responseData.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let appetizerResponse = try JSONDecoder().decode(AppetizerDTO.self, from: data)
                completed(.success(appetizerResponse.record.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }.resume()
    }
    
    func downloadImage(fromURLString: String, completed: @escaping (UIImage?) -> Void) {
        let cahceKey = NSString(string: fromURLString)
        if let cachedImage = cache.object(forKey: cahceKey) {
            completed(cachedImage)
            return
        }
        
        guard let url = URL(string: fromURLString) else {
            completed(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cahceKey)
        }.resume()
    }
}
