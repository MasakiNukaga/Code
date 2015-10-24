class UserCode < ActiveRecord::Base
  has_many :commecos, dependent: :destroy
  belongs_to :user

  def self.search(search)
    if search
      self.where("title like ? OR language like ?", "%#{search}%", "%#{search}%")
    else
      find(:all)
    end
  end
end
