class Author < ApplicationRecord
  validates :name, presence: true, uniqueness: true 
  #uniqueness allows no two authors to have the same name
  validates :phone_number, length: { is: 10 }
end
