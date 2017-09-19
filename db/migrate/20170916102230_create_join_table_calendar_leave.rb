class CreateJoinTableCalendarLeave < ActiveRecord::Migration[5.1]
  def change
    create_join_table :calendars, :leaves do |t|
      t.index [:calendar_id, :leave_id]
    end
  end
end
