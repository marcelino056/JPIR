class Zone < ApplicationRecord
  include AASM

  aasm :column => 'status' do
  end
end
