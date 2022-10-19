//
//  APIManager.swift
//  nexflix-clone
//
//  Created by 薮木翔大 on 2022/10/19.
//

import Foundation


class APIManager{
//    var url ="https://api.themoviedb.org/3/trending/all/day?api_key=7c5bce46dc6cd608736f9c5f86210170&language=ja"
    struct Constants {
        static let API_KEY = "7c5bce46dc6cd608736f9c5f86210170"
        static let baseURL = "https://api.themoviedb.org"
    }
    
    enum APIError: Error {
        case failedTogetData
    }
    
    static let shared = APIManager()
    
    
    func getTrendMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data ,error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendMovieResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
            
            
        }
        task.resume()
    }
    //https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>&language=ja&page=1
    
    func getUpComingMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=ja") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data ,error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendMovieResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
            
            
        }
        task.resume()
    }
    
    func getPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        //https://api.themoviedb.org/3/movie/popular?api_key=<<api_key>>&language=ja&page=1
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=ja") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data ,error == nil else {
                return
            }
            do{
            
                let results = try JSONDecoder().decode(TrendMovieResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
            
            
        }
        task.resume()
    }
    
}
