class Article < ApplicationRecord
	has_many  :comments,  dependent: :destroy
	validates :title, presence: true,
                    length: { minimum: 5 }

    validates :contact_number, presence: true,
                    length: { :minimum => 10, :maximum => 15 } 
  
  

 def self.search(search)
  if search
    where('title LIKE ?', "%#{search}%")
  else
    all
   end
end


end