//
//  LibraryService.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/28/23.
//

import Foundation

class LibraryService {
    static let shared = LibraryService()
    private init() {}
    
    func makeLibraryStampRequest() -> URLRequest {
        let baseURL = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""
        guard let url = URL(string: baseURL + "stamp") else { fatalError("Can't find URL") }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func getLibraryStampData() async throws -> LibraryStampResponseDTO? {
        do {
            let request = self.makeLibraryStampRequest()
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return parseCheckData(data: data)
        } catch {
            throw error
        }
    }
    
    private func parseCheckData(data: Data) -> LibraryStampResponseDTO? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(LibraryStampResponseDTO.self, from: data)
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
