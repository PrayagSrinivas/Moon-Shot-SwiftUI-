//
//  Bundle-Decodable.swift
//  SwiftUI(Project 8-Moon Shot)
//
//  Created by Srinivas Sahu on 10/11/21.
//

import Foundation

extension Bundle{
    func decode<T:Codable>(_ file:String) -> T{
        guard let url = self.url(forResource: file, withExtension:nil) else{
            fatalError("Failed to locate\(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load\(file) in bundle.")
        }
        print(data)
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        guard let loaded = try? decoder.decode(T.self,from:data) else{
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
    }
}
