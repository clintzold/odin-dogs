class Dog < ApplicationRecord
  validates :name, :age, :weight, :breed, presence: true
end
