
import Foundation
 
struct Shots: Codable {
	public var id : Int?
	public var title : String?
	public var description : String?
	public var width : Int?
	public var height : Int?
	public var images : Images?
	public var views_count : Int?
	public var likes_count : Int?
	public var comments_count : Int?
	public var attachments_count : Int?
	public var rebounds_count : Int?
	public var buckets_count : Int?
	public var created_at : String?
	public var updated_at : String?
	public var html_url : String?
	public var attachments_url : String?
	public var buckets_url : String?
	public var comments_url : String?
	public var likes_url : String?
	public var projects_url : String?
	public var rebounds_url : String?
	public var animated : Bool?
	public var tags : Array<String>?
	public var user : User?
	public var team : Team?
}
