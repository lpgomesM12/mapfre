class AddDataollunsToApolice < ActiveRecord::Migration
  def change
    add_column :apolices, :data_propostaaceita, :datetime
  end
end
