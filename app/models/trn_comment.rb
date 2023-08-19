class TrnComment < ApplicationRecord
  belongs_to :trn_user
  belongs_to :trn_new
end
