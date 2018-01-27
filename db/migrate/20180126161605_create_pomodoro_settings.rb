class CreatePomodoroSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :pomodoro_settings do |t|
      t.integer :pomodoro_time
      t.integer :shortbreak_time
      t.integer :longbreak_time

      t.timestamps
    end
  end
end
