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
    
    private func makeUpdateNoteRequest(postId: Int64, isListView: Bool) -> URLRequest {
            let baseURL = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""
            guard let url = URL(string: baseURL + "likey") else { fatalError("Can't find URL") }
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let updateData = NoteListRequestDTO(postId: postId, isListView: isListView)

            do {
                let jsonData = try JSONEncoder().encode(updateData)
                request.httpBody = jsonData
            } catch {
                fatalError("데이터를 인코딩하는 중 에러 발생: \(error)")
            }
            return request
        }
    
    func updateNote(postId: Int64, isListView: Bool) async throws  {
            do {
                let request = self.makeUpdateNoteRequest(postId: postId, isListView: isListView)
                print("Request URL: \(request.url?.absoluteString ?? "No URL")")
                print("Request Headers: \(request.allHTTPHeaderFields ?? [:])")
                print("Request Body: \(String(data: request.httpBody ?? Data(), encoding: .utf8) ?? "No body")")
                let (data, response) = try await URLSession.shared.data(for: request)
            print("Response: \(response)")

            guard response is HTTPURLResponse else {
                throw NetworkError.responseError
            }
        } catch {
            throw error
        }
    }

    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
}
