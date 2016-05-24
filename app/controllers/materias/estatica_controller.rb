module Materias
  class EstaticaController < ApplicationController
    def index
    end

    def equilibrio_cuerpos_rigidos
      @videos = Video.order('created_at DESC')
    end
  end
end
