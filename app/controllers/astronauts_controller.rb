class AstronautsController < ApplicationController

  def index
    @astronaut = Astronaut.all 
  end

end
