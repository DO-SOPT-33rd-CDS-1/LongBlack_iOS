//
//  NoteViewService.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/30/23.
//


import Foundation

class NoteViewService {
    static let shared = NoteViewService()
    private init() {}
    
    func makeNoteListRequest(post: Int) -> URLRequest {
        let baseURL = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""
        guard let url = URL(string: baseURL + "post") else { fatalError("Can't find URL") }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func getNoteList(post: Int) async throws -> NoteListResponseDTO {
        do {
            let request = self.makeNoteListRequest(post: post)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard response is HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            guard let parseData = parseNoteListData(data: data)
                        else {
                            throw NetworkError.responseDecodingError
                        }
                        return parseData
                    } catch {
                        throw error
                    }
    }
    
    private func parseNoteListData(data: Data) -> NoteListResponseDTO? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(NoteListResponseDTO.self, from: data)
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
