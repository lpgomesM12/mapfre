class AddFlagToFlagPropostaaceita < ActiveRecord::Migration
  def change
    add_column :apolices, :flag_propostaaceita, :boolean
  end
end
