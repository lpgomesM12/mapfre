class Add < ActiveRecord::Migration
  def change
    add_column :apolices, :numr_mensal, :string
  end
end
