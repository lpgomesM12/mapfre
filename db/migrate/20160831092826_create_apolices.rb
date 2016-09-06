class CreateApolices < ActiveRecord::Migration
  def change
    create_table :apolices do |t|
      t.string :ramo
      t.string :produto
      t.string :apolice
      t.string :item
      t.datetime :data_proposta
      t.datetime :vig_inicio
      t.datetime :vig_termino
      t.string :nome_segurado
      t.string :cpf
      t.string :endereco
      t.string :bairro
      t.string :cidade
      t.string :cep
      t.string :uf
      t.string :valr_premioliquido
      t.string :valr_adicional
      t.string :valr_custo
      t.string :valr_iof
      t.string :valr_premiototal
      t.string :desc_obs

      t.timestamps null: false
    end
  end
end
