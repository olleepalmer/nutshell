class AddSummaryToVersions < ActiveRecord::Migration

  def change
    add_column :versions, :summary, :string
  end

end
