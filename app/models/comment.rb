class Comment < ApplicationRecord
  belongs_to :article
  has_many :replies, dependent: :destroy
  has_many :likes, dependent: :destroy
end
