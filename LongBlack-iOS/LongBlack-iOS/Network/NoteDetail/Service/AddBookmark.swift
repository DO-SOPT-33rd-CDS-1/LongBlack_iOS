//
//  AddBookmark.swift
//  LongBlack-iOS
//
//  Created by Woo Jye Lee on 12/1/23.
//

import Foundation

class AddBookmark {
    static let shared = AddBookmark()
    private init() {}
    
    func makeRequestBody(bookmarkIdx: Int) -> Data? {
        do {
            let data = postRequestBody(bookmarkIdx: bookmarkIdx)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    func makeRequest(body: Data?) -> URLRequest {
        // let url = URL(string: "http://long-black.kro.kr/api/bookmark/1")!
        let baseurl = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""
        guard let url = URL(string: "http://" + baseurl + "bookmark/1") else { fatalError("Can't find URL") }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let body = body {
            request.httpBody = body
        }
        
        return request
    }
    
    func PostAddBookmark(bookmarkIdx: Int) async throws -> Int {
        do {
            guard let body = makeRequestBody(bookmarkIdx: bookmarkIdx)
            else { throw NetworkError.requstEncodingError }
            
            let request = self.makeRequest(body: body)
            let (_, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return httpResponse.statusCode
        } catch {
            throw error
        }
        
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}
