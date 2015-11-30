class EstaticaController < ApplicationController
  def equilibrio_cuerpos_rigidos
    @videos = Video.order('created_at DESC')
  end
end
