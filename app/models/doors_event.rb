class DoorsEvent < ApplicationRecord
  enum state: [ :closed, :open ]
end
