class Item < ApplicationRecord
  belongs_to :genre, optional: true
  attachment :image
end
