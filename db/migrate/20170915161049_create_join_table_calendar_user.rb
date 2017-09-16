class CreateJoinTableCalendarUser < ActiveRecord::Migration[5.1]
  def change
    create_join_table :calendars, :users do |t|
      t.index [:calendar_id, :user_id]
    end
  end
end
