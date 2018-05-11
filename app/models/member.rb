class Member < ApplicationRecord
  belongs_to :church

  serialize :present
end
