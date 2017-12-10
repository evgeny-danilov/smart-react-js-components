class AddDateTimeFieldsToSetting < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :date, :date
    add_column :settings, :time, :time
    add_column :settings, :datetime, :datetime
  end
end
