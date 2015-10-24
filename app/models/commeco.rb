class Commeco < ActiveRecord::Base
  belongs_to :user_code
  belongs_to :user
end
