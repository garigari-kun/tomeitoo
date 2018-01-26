class PomodorosController < ApplicationController

  before_action :find_pomodoro, only: [:update, :destroy]

  def create
    @pomodoro = current_user.pomodoros.build(
      :start_at => Time.at(params[:pomodoro][:start_at].to_i / 1000.0),
      :end_at => DateTime.now()
    )
    if @pomodoro.save
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

    def set_params
      return params.require(:pomodoro).permit(:start_at)
    end


end
