class Admin < User
  def administrator?
    true
  end
end