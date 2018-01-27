class AddUserIdToPomodoroSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :pomodoro_settings, :user_id, :integer
  end
end
