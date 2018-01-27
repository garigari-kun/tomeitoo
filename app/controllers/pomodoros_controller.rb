class PomodorosController < ApplicationController

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


end
