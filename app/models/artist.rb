class Artist < ActiveRecord::Base
	has_one :user, as: :profile, dependent: :destroy
	accepts_nested_attributes_for :user

	geocoded_by :address
	after_validation :geocode

	def address
		"#{self.street_address} #{self.city}, #{self.state} #{self.zip_code}"
	end

	def has_avatar?
		retval = false
		if self.user.avatar.present?
			retval = true
		end
	end
end
