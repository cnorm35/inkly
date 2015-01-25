class Post < ActiveRecord::Base
	belongs_to :user
	acts_as_votable
	has_attached_file :image, :styles => { :medium => "500x500", :thumb => "100x100" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]


	def score
		self.get_upvotes.size - self.get_downvotes.size
	end
end
