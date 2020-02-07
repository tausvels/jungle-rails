class Sale < ActiveRecord::Base
  
#--- Class method and this creates an AR Scope ----
  
  def self.active
    # ? in the quoted sql querry below are the place-holder for current date which is
    # passed as two arguments, Date.current
    @sale = where("sales.starts_on <= ? AND sales.ends_on >= ?", 
      Date.current, Date.current)
  end

# ---- INSTANCE METHODS ---------- ##
  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

end
