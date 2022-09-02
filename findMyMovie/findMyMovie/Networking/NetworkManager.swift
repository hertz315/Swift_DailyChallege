//
//  NetworkManager.swift
//  findMyMovie
//
//  Created by Hertz on 8/29/22.
//

import Foundation

// 0
// 에러를 정의
enum NetworkError: Error {
    case networkingError
    case dataError
    case parseError
}

// 0
//MARK: - 🚀Networking (서버와 통신하는) 클래스 모델
final class NetworkManager {
    
    // 🚀여러화면에서 통신을 한다면, 일반적으로 싱글톤으로 만듦
    static let shared = NetworkManager()
    // 여러객체를 추가적으로 생성하지 못하도록 설정
    private init() {}
    
    // Result타입에는 성공의 케이스와 실패의 케이스를 담을수 있다
    typealias NetworkCompletion = (Result<[Movie], NetworkError>) -> Void

    // 네트워킹 요청하는 함수 (음악데이터 가져오기)
    // URL을 담당
    func fetchMovie(queryValue: String, completion: @escaping NetworkCompletion) {
    
        let urlString = "\(MovieApi.requestUrl)\(queryValue)"
        print(urlString)
        
        // performRequest함수를 실행시키고 performRequest실행이 끝는 다음에 반환값을 result 타입으로 전달해 준다
        performRequest(with: urlString) { result in
            
            // 전달받은 result타입을 다시 콜백함수에다가 전달하고 있다
            completion(result)
            
        }
        
    }
    
    // 실제 Request하는 함수 (비동기적 실행 ===> 클로저 방식으로 끝난 시점을 전달 받도록 설계)
    private func performRequest(with urlString: String, completion: @escaping NetworkCompletion) {
        //print(#function)
        let query: String = urlString
        let encodedQuery: String = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        guard let queryUrl = URL(string: encodedQuery) else { return }
        
        // 통신할 Request 객체에  Header를 추가해줘야 한다!!
        var requestURL = URLRequest(url: queryUrl)
        requestURL.addValue(Client.clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        requestURL.addValue(Client.clientKEY, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: requestURL) { (data, response, error) in
            if error != nil {
                print(error!)
                completion(.failure(.networkingError))
                return
            }
            
            guard let safeData = data else {
                completion(.failure(.dataError))
                return
            }
            
            // 메서드 실행해서, 결과를 받음
            // 안전한 데이터를 가지고 parseJSON함수를 호출
            if let movie = self.parseJSON(safeData) {
                print("Parse 실행")
                completion(.success(movie))
            } else {
                print("Parse 실패")
                completion(.failure(.parseError))
            }
        }
        task.resume()
    }
    
    // 받아본 데이터 분석하는 함수 (동기적 실행)
    // 파싱을 담당
    private func parseJSON(_ movieData: Data) -> [Movie]? {
        //print(#function)
    
        // 성공
        do {
            // 우리가 만들어 놓은 구조체(클래스 등)로 변환하는 객체와 메서드
            // (JSON 데이터 ====> MusicData 구조체)
            let movieData = try JSONDecoder().decode(MovieData.self, from: movieData)
            return movieData.items
        // 실패
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
