class AddfvlportalToPolice < ActiveRecord::Migration
  def change
    add_column :apolices, :valor_franquiaportao, :string
  end
end
