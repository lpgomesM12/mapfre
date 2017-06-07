class AddcollumToApolice < ActiveRecord::Migration
  def change
    add_column :apolices, :apartamento, :string
  end
end
