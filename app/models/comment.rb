class Comment < ApplicationRecord
  belongs_to :article
  has_many :replies, dependent: :destroy
  has_many :likes, dependent: :destroy




  def self.search(search)

    if search
      return where('commenter LIKE ?', "%#{search}%")
    else
      return all
    end
   end


end
