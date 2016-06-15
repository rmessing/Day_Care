class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :handoffs, :type, :attend
  end
end
