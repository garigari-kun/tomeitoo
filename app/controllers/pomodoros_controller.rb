class PomodorosController < ApplicationController

  before_action :find_pomodoro, only: [:update, :destroy]

  def create
    @pomodoro = Pomodoro.new()
    @pomodoro.start_at = DateTime.now()

    if @pomodoro.save
      respond_to do | format |
        format.html
        format.js
      end
    end
  end

  def update
    @pomodoro.end_at = DateTime.now()
    if @pomodoro.save()
      respond_to do | format |
        format.html
        format.js
      end
    end
  end

  def destroy
    if @pomodoro.destroy()
      respond_to do | format |
        format.html
        format.js
      end
    end
  end


  private

    def find_pomodoro
      return @pomodoro = Pomodoro.find(params[:id])
    end


end
