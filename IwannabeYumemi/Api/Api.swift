//
//  Api.swift
//  IwannabeYumemi
//
//  Created by 矢守叡 on 2019/11/16.
//  Copyright © 2019 yamolean. All rights reserved.
//

import Foundation

struct Api {
    
    // 参考URL
    // https://labs.goo.ne.jp/api/jp/hiragana-translation/
    static func convertToHiragana(hiragana: String, onSuccess: @escaping(Response) -> Void, onError: @escaping(String) -> Void) {
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
                        onSuccess(model)
                    }
                } catch let errorMessage {
                    onError(errorMessage.localizedDescription)
                }
            } else {
                onError(error?.localizedDescription ?? "エラーです")
            }
            
        }.resume()
        
    }
}
