//
//  DeleteBookmark.swift
//  LongBlack-iOS
//
//  Created by Woo Jye Lee on 12/1/23.
//

import Foundation

class DeleteBookmark {
    
    static let shared = DeleteBookmark()
    private init() {}
    
    func makeRequest(postid: Int) -> URLRequest {
        let url = URL(string: "http://long-black.kro.kr/api/bookmark/1")!
        // let url = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return request
    }
    
    func DeleteBookmarkFunc(postid: Int) async throws -> postRequestBody? {
        do {
            
            let request = self.makeRequest(postid: postid)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return parseIdxData(data: data)
        } catch {
            throw error
        }
        
    }
    
    private func parseIdxData(data: Data) -> postRequestBody? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(postRequestBody.self, from: data)
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
