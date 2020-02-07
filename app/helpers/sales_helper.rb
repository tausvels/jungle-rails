module SalesHelper
  
  # active.any can be called because Sale.active is a class method that returns
  # a query itself on which additional queries can be done.
  def active_sale?
    Sale.active.any?
  end

  def get_sale
    Sale.active.first
  end
end