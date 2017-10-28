import Foundation

struct Team: Codable {
	public var id : Int?
	public var name : String?
	public var username : String?
	public var html_url : String?
	public var avatar_url : String?
	public var bio : String?
	public var location : String?
	public var links : Links?
	public var buckets_count : Int?
	public var comments_received_count : Int?
	public var followers_count : Int?
	public var followings_count : Int?
	public var likes_count : Int?
	public var likes_received_count : Int?
	public var projects_count : Int?
	public var rebounds_received_count : Int?
	public var shots_count : Int?
	public var can_upload_shot : Bool?
	public var type : String?
	public var pro : Bool?
	public var buckets_url : String?
	public var followers_url : String?
	public var following_url : String?
	public var likes_url : String?
	public var projects_url : String?
	public var shots_url : String?
	public var created_at : String?
	public var updated_at : String?
	public var members_count : Int?
	public var members_url : String?
}
