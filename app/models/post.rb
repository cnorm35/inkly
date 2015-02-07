class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	acts_as_votable
	has_attached_file :image, :styles => { :medium => "500x500", :thumb => "100x100" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	validates_presence_of :image


#need to add size validations
# validates_attachment :avatar, :presence => true,
#   :content_type => { :content_type => "image/jpeg" },
#   :size => { :in => 0..10.kilobytes }

	def score
		self.get_upvotes.size - self.get_downvotes.size
	end
end
