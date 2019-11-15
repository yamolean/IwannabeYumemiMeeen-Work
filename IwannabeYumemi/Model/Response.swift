//
//  Response.swift
//  IwannabeYumemi
//
//  Created by 矢守叡 on 2019/11/16.
//  Copyright © 2019 yamolean. All rights reserved.
//

import Foundation

struct Response: Codable {
    let hiragana: String
    let type: String
    let requestID: String
    
    enum CodingKeys: String, CodingKey {
      case hiragana = "converted"
      case type = "output_type"
      case requestID = "request_id"
    }
}

//{
//    "converted": "やもり",
//    "output_type": "hiragana",
//    "request_id": "labs.goo.ne.jp\t1573829322\t0"
//}
