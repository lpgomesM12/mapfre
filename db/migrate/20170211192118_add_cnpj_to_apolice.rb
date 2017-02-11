class AddCnpjToApolice < ActiveRecord::Migration
  def change
    add_column :apolices, :cnpj, :boolean
  end
end
