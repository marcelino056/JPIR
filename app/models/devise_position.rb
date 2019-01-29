class DevisePosition < ApplicationRecord
  include AASM

  aasm :column => 'status' do
  end
  belongs_to :device
  belongs_to :location
end
