//
//  ImageHelper.swift
//  AzureOverall
//
//  Created by Pursuit on 3/30/20.
//  Copyright © 2020 Neema Philippe. All rights reserved.
//

import Foundation
import UIKit

class ImageManager {
    
    static let manager = ImageManager()
    
    func getImage(urlStr: String, completionHandler: @escaping (Result<UIImage, AppError>) -> () ) {
        guard let url = URL(string: urlStr) else {
            
            completionHandler(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                completionHandler(.failure(.badURL))
                return
            }
            guard let data = data else {
                completionHandler(.failure(.noDataReceived))
                return
            }
            guard let image = UIImage(data: data) else {
                completionHandler(.failure(.notAnImage))
                return
            }
            completionHandler(.success(image))
        }.resume()
    }
    private init() {}
}
