class Device < ApplicationRecord
  include AASM

  aasm :column => 'status' do
  end
end
