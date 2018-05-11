class Church < ApplicationRecord
  has_many :members
  has_many :visitors
  belongs_to :group
end
