class Article < ApplicationRecord
	has_many  :comments,  dependent: :destroy
	validates :title, presence: true,
                    length: { minimum: 5 }

    validates :contact_number, presence: true,
                    length: { :minimum => 10, :maximum => 15 }

   # validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
    #validates :email, presence: true, :format=> {:With => /\w+@\w+\.{1}[a-zA-Z]{2,}/ }       
  

 def self.search(search)
  if search
    where('title LIKE ?', "%#{search}%")
  else
    all
   end
end

end