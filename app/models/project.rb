class Project < ActiveRecord::Base
  validates :name, :presence => true
  has_many :tickets, :dependent => :delete_all
  has_many :permissions, :as => :thing
  
  scope :readable_by, 
  lambda { |user| joins(:permissions).where(:permissions => { :action => "view",
                                                              :user_id => user.id })
  }
  
  def self.for(user)
    user.admin? ? Project : Project.readable_by(user)
  end
  
  def last_ticket 
    tickets.last
  end
  
  def find_project 
    @project = Project.for(current_user).find(params[:id])
    rescue ActiveRecord::RecordNotFound 
    flash[:alert] = "The project you were looking for could not be found." 
    redirect_to projects_path
  end
  
  def title
    name
  end
  
end
