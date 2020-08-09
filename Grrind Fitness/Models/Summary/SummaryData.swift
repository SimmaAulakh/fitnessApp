/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct SummaryData : Codable {
	let id : Int?
	let user_id : Int?
	let category : Category?
	let workout_date : String?
	let total_time : String?
	let created_at : String?
	let updated_at : String?
	let weekdays : Weekdays?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case user_id = "user_id"
		case category = "category"
		case workout_date = "workout_date"
		case total_time = "total_time"
		case created_at = "created_at"
		case updated_at = "updated_at"
		case weekdays = "weekdays"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
		category = try values.decodeIfPresent(Category.self, forKey: .category)
		workout_date = try values.decodeIfPresent(String.self, forKey: .workout_date)
		total_time = try values.decodeIfPresent(String.self, forKey: .total_time)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		weekdays = try values.decodeIfPresent(Weekdays.self, forKey: .weekdays)
	}

}
