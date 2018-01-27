class PomodoroSettingsController < ApplicationController

  before_action :authenticate_user!

  def index
    @timer_options = (5..90).step(5).map { |n| ["#{n} min", n] }
    if PomodoroSetting.exists?(user_id: current_user.id)
      @pomodoro_setting = PomodoroSetting.find_by(user_id: current_user.id)
      @pomodoro_default_settings = {
        :pomodoro_time => @pomodoro_setting.pomodoro_time,
        :short_break => @pomodoro_setting.shortbreak_time,
        :long_break => @pomodoro_setting.longbreak_time
      }
    else
      @pomodoro_setting = current_user.build_pomodoro_setting()
      @pomodoro_default_settings = {
        :pomodoro_time => 25,
        :short_break => 5,
        :long_break => 15
      }
    end
  end

  def create_or_update
    if PomodoroSetting.exists?(user_id: current_user.id)
      @pomodoro_setting = PomodoroSetting.find_by(user_id: current_user.id)
      if @pomodoro_setting.update(set_pomodoro_settings_params)
        flash[:success] = "設定が変更されました"
        redirect_to pomodoro_settings_path
      else
        render 'update'
      end
    else
      @pomodoro_setting = current_user.build_pomodoro_setting(set_pomodoro_settings_params)
      if @pomodoro_setting.save
        flash[:success] = "設定が保存されました"
        redirect_to pomodoro_settings_path
      else
        render 'create'
      end
    end
  end

  private

    def set_pomodoro_settings_params
      return params.require(:pomodoro_setting).permit(:pomodoro_time, :shortbreak_time, :longbreak_time)
    end

end
