class AddAdminIdToCalendar < ActiveRecord::Migration[5.1]
  def change
    add_column :calendars, :admin_id, :integer
  end
end
