class Project < ActiveRecord::Base
  validates :name, :presence => true
  has_many :tickets, :dependent => :delete_all
  has_many :permissions, :as => :thing
  
  scope :readable_by, 
  lambda { |user| joins(:permissions).where(:permissions => { :action => "view",
                                                              :user_id => user.id })
  }
  
end
