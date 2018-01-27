class TomeitoosController < ApplicationController
  helper :pomodoros

  def index
    @pomodoro = current_user.pomodoros.build()
    if user_signed_in?
      @pomodoro_setting = PomodoroSetting.find_by(user_id: current_user.id)
      @pomodoro_default_settings = {
        :pomodoro_time => @pomodoro_setting ? @pomodoro_setting.pomodoro_time : 25,
        :short_break => @pomodoro_setting ? @pomodoro_setting.shortbreak_time : 5,
        :long_break => @pomodoro_setting ? @pomodoro_setting.longbreak_time : 15
      }
      render "user_index"
    else
      @pomodoro_default_settings = {
        :pomodoro_time => 25,
        :short_break => 5,
        :long_break => 15
      }
      render "index"
    end
  end

end
