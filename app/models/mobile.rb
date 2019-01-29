class Mobile < ApplicationRecord
  include AASM

  aasm :column => 'status' do
  end
  belongs_to :user
end
