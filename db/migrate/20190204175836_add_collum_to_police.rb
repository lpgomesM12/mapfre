class AddCollumToPolice < ActiveRecord::Migration
  def change
    add_column :apolices, :page, :string
  end
end
