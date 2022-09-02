//
//  Networking.swift
//  LovelyCatPhoto
//
//  Created by Hertz on 9/2/22.
//

import Foundation


// 0
//MARK: - Networking (서버와 통신하는) 클래스 모델
final class NetworkManager {
    
    // 여러화면에서 통신을 한다면, 일반적으로 싱글톤으로 만듦
    static let shared = NetworkManager()
    private init() {}
    
    // getMethod
    func getMethod(completionHandler: @escaping ([CatImageData]?) -> Void) {
        
        // URL구조체 만들기
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?format=json&limit=10" ) else {
            print("Error: cannot create URL")
            completionHandler(nil)
            return
        }
        // URL요청 생성
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // CatImageDate 모델 배열 생성
        var catImageList: [CatImageData]?
        
        // 요청을 가지고 작업세션시작
        URLSession.shared.dataTask(with: request) { data, response, error in
            // 에러가 없어야 넘어감
            guard error == nil else {
                print("Error: error calling GET")
                print(error!)
                completionHandler(nil)
                return
            }
            
            // 옵셔널 바인딩
            guard let safeData = data else {
                print("Error: Did not receive data")
                completionHandler(nil)
                return
            }
            
            // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                completionHandler(nil)
                return
            }
            
            // 데이터모델을, JSONDecoder로 decode코드로 구현 ⭐️
            do {
                let decoder = JSONDecoder()
                let catGetImage = try? decoder.decode(CatImageData.self, from: safeData)
                catImageList = catGetImage
                completionHandler(catImageList)
                return
            } catch {
                
            }
            
        }.resume()     // 시작
    }
}


