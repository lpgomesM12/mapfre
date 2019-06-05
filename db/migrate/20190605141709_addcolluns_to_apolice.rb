class AddcollunsToApolice < ActiveRecord::Migration
  def change
    add_column :apolices, :valor_mensal, :decimal, precision: 10, scale: 2
    add_column :apolices, :qtd_parcelas, :string
  end
end
