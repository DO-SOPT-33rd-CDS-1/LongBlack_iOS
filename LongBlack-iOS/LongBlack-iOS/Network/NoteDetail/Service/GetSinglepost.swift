//
//  getSinglepost.swift
//  LongBlack-iOS
//
//  Created by Woo Jye Lee on 11/29/23.
//

import Foundation

class GetSinglepost {
    
    static let shared = GetSinglepost()
    private init() {}
    
    func makeRequest(postid: Int) -> URLRequest {
        let url = URL(string: "http://long-black.kro.kr/api/post/1")!
        // let url = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return request
    }
    
    func GetSinglePost(postid: Int) async throws -> ArticleDataModel? {
        do {
            
            let request = self.makeRequest(postid: postid)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return parseArticleData(data: data)
        } catch {
            throw error
        }
        
    }
    
    private func parseArticleData(data: Data) -> ArticleDataModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(ArticleDataModel.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}
