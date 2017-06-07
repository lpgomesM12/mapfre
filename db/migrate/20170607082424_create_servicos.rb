class CreateServicos < ActiveRecord::Migration
  def change
    create_table :servicos do |t|
      t.string :nome
      t.references :apolice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
