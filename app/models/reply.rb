class Reply < ApplicationRecord
	 has_many :reply_likes, dependent: :destroy
	 belongs_to :user


    
  def self.search(search)
#byebug
    if search
      return where('body LIKE ?', "%#{search}%")
    else
      return all
    end
   end



end
