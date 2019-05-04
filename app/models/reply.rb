class Reply < ApplicationRecord
	 has_many :reply_likes, dependent: :destroy
	 belongs_to :user
end
