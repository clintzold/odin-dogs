class Dog < ApplicationRecord
  validates :name, :age, :weight, :breed, presence: true

  def as_json(options = {})
    super(only: [:name, :age, :weight, :breed])
  end
end
