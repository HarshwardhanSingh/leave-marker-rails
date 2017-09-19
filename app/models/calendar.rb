class Calendar < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :leaves

  validates :name, :description, presence: true, length: { minimum: 3 }
end
