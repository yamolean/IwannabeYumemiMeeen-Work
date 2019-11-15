//
//  Api.swift
//  IwannabeYumemi
//
//  Created by 矢守叡 on 2019/11/16.
//  Copyright © 2019 yamolean. All rights reserved.
//

import Foundation

struct Api {
    
    static func convertToHiragana(hiragana: String, comletion: @escaping (Response) -> Void) {
        let url = URL(string: "https://labs.goo.ne.jp/api/hiragana")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type" : "application/json"]
        
        let parameters = [
             "app_id": "816d8a180c9be1fc87c822029e708ec828774c20bb7cc2274a351224edba77f6",
             "sentence": hiragana,
             "output_type": "hiragana"
        ]
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let response = response {
                print(response)
                do {
                    let model = try JSONDecoder().decode(Response.self, from: data)
                    DispatchQueue.main.async {
                        comletion(model)
                    }
                } catch {
                    print("Serialize Error")
                }
            } else {
                print(error ?? "Error")
            }
            
        }.resume()
        
    }
}


//func post(url urlString: String, parameters: [String: Any]) {
//        let url = URL(string: urlString)
//        var request = URLRequest(url: url!)
//        request.httpMethod = "POST"
//
//        let parametersString: String = parameters.enumerated().reduce("?") { (input, tuple) -> String in
//            switch tuple.element.value {
//            case let int as Int: return input + tuple.element.key + "=" + String(int) + (parameters.count - 1 > tuple.offset ? "&" : "")
//            case let string as String: return input + tuple.element.key + "=" + string + (parameters.count - 1 > tuple.offset ? "&" : "")
//            default: return input
//            }
//        }
//
//        request.httpBody = parametersString.data(using: String.Encoding.utf8)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data, let response = response {
//                print(response)
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
//                    print(json)
//                } catch {
//                    print("Serialize Error")
//                }
//            } else {
//                print(error ?? "Error")
//            }
//        }
//        task.resume()
//    }
//
//}
