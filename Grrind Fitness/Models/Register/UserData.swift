/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct UserData : Codable {
	let firstname : String?
	let lastname : String?
	let email : String?
	let country : String?
	let dob : String?
	let city : String?
	let name : String?
	let gender : String?
	let weight : String?
	let height : String?
	let updated_at : String?
	let created_at : String?
	let id : Int?
    let token: String?
	let roles : [Roles]?

	enum CodingKeys: String, CodingKey {

		case firstname = "firstname"
		case lastname = "lastname"
		case email = "email"
		case country = "country"
		case dob = "dob"
		case city = "city"
		case name = "name"
		case gender = "gender"
		case weight = "weight"
		case height = "height"
		case updated_at = "updated_at"
		case created_at = "created_at"
		case id = "id"
		case roles = "roles"
        case token = "token"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		firstname = try values.decodeIfPresent(String.self, forKey: .firstname)
		lastname = try values.decodeIfPresent(String.self, forKey: .lastname)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		dob = try values.decodeIfPresent(String.self, forKey: .dob)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		gender = try values.decodeIfPresent(String.self, forKey: .gender)
		weight = try values.decodeIfPresent(String.self, forKey: .weight)
		height = try values.decodeIfPresent(String.self, forKey: .height)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		roles = try values.decodeIfPresent([Roles].self, forKey: .roles)
        token = try values.decodeIfPresent(String.self, forKey: .token)
	}

}
