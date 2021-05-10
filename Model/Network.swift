//
//  ModelData.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 27.04.2021.
//

import Foundation
import SwiftUI

enum MoviesListCategory: String {
    case nowPlaying = "now_playing"
    case popular = "popular"
    case topRated = "top_rated"
    case upcoming = "upcoming"
}

final class Network: ObservableObject {
    @Published var category: MoviesList?
    @Published var movie: Movie?
    @Published var credits: MovieCredits?
    @Published var similarMovies: MoviesList?
    @Published var configuration: Configuration?
    
    private static let apiUrl = "https://api.themoviedb.org/3";
    private static let apiKey = "a9f1c26c159dbee10a41c350f29d6a46";

    func loadCategory(category: MoviesListCategory) {
        var urlComponents = URLComponents(string: "\(Network.apiUrl)/movie/\(category.rawValue)")!

        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: Network.apiKey)
        ]

        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            if let error = error {
                fatalError("Client Error. \(error)")
            }
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
                fatalError("Server Error.")
            }
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let decoder = JSONDecoder();
                        decoder.keyDecodingStrategy = .convertFromSnakeCase

                        decoder.dateDecodingStrategy = .custom({ decoder in
                            let container = try decoder.singleValueContainer()
                            let dateString = try container.decode(String.self)

                            let dateFormatter = ISO8601DateFormatter()
                            dateFormatter.formatOptions = [.withFullDate, .withDashSeparatorInDate]
                            return dateFormatter.date(from: dateString)!
                        })

                        self.category = try decoder.decode(MoviesList.self, from: data)
                    } catch {
                        fatalError("Decoder Error. \(error)")
                    }
                }
            }
        }
        task.resume()
    }
    
    func loadMovie(movieId: Int) {
        var urlComponents = URLComponents(string: "\(Network.apiUrl)/movie/\(movieId)")!

        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: Network.apiKey)
        ]

        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            if let error = error {
                fatalError("Client Error. \(error)")
            }
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
                fatalError("Server Error.")
            }
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let decoder = JSONDecoder();
                        decoder.keyDecodingStrategy = .convertFromSnakeCase

                        decoder.dateDecodingStrategy = .custom({ decoder in
                            let container = try decoder.singleValueContainer()
                            let dateString = try container.decode(String.self)

                            let dateFormatter = ISO8601DateFormatter()
                            dateFormatter.formatOptions = [.withFullDate, .withDashSeparatorInDate]
                            return dateFormatter.date(from: dateString)!
                        })

                        self.movie = try decoder.decode(Movie.self, from: data)
                    } catch {
                        fatalError("Decoder Error. \(error)")
                    }
                }
            }
        }
        task.resume()
    }
    
    func loadCredits(movieId: Int) {
        var urlComponents = URLComponents(string: "\(Network.apiUrl)/movie/\(movieId)/credits")!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: Network.apiKey)
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            if let error = error {
                fatalError("Client Error. \(error)")
            }
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
                fatalError("Server Error.")
            }
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let decoder = JSONDecoder();
                        decoder.keyDecodingStrategy = .convertFromSnakeCase

                        self.credits = try decoder.decode(MovieCredits.self, from: data)
                    } catch {
                        fatalError("Decoder Error. \(error)")
                    }
                }
            }
        }
        task.resume()
    }
    
    func loadSimilarMovies(movieId: Int) {
        var urlComponents = URLComponents(string: "\(Network.apiUrl)/movie/\(movieId)/similar")!

        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: Network.apiKey)
        ]

        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            if let error = error {
                fatalError("Client Error. \(error)")
            }
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
                fatalError("Server Error.")
            }
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let decoder = JSONDecoder();
                        decoder.keyDecodingStrategy = .convertFromSnakeCase

                        decoder.dateDecodingStrategy = .custom({ decoder in
                            let container = try decoder.singleValueContainer()
                            let dateString = try container.decode(String.self)

                            let dateFormatter = ISO8601DateFormatter()
                            dateFormatter.formatOptions = [.withFullDate, .withDashSeparatorInDate]
                            return dateFormatter.date(from: dateString)!
                        })

                        self.similarMovies = try decoder.decode(MoviesList.self, from: data)
                    } catch {
                        fatalError("Decoder Error. \(error)")
                    }
                }
            }
        }
        task.resume()
    }
    
    func loadConfiguration() {
        var urlComponents = URLComponents(string: "\(Network.apiUrl)/configuration")!

        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: Network.apiKey)
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            if let error = error {
                fatalError("Client Error. \(error)")
            }
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
                fatalError("Server Error.")
            }
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let decoder = JSONDecoder();
                        decoder.keyDecodingStrategy = .convertFromSnakeCase

                        self.configuration = try decoder.decode(Configuration.self, from: data)
                    } catch {
                        fatalError("Decoder Error. \(error)")
                    }
                }
            }
        }
        task.resume()
    }
}
