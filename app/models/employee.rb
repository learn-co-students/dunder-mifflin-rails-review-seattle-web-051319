class Employee < ApplicationRecord
  belongs_to :dog
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :alias, uniqueness:true
  validates :alias, presence:true
  validates :title, presence:true, uniqueness:true
  validates :office, presence:true
end
