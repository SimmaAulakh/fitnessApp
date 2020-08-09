//
//  Dropset.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 20/07/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation

struct Dropset : Codable {
    let video_file : String?
    let audio_file : String?
   

    enum CodingKeys: String, CodingKey {

        case video_file = "video_file"
        case audio_file = "audio_file"
       
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        video_file = try values.decodeIfPresent(String.self, forKey: .video_file)
        audio_file = try values.decodeIfPresent(String.self, forKey: .audio_file)
    }

}
