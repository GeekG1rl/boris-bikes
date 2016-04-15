class Bike
  def working?
    return false if @broken == true
    true
  end

  def report_broken
  	@broken = true
  end

end
