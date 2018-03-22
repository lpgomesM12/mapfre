class CreateCoberturas < ActiveRecord::Migration
  def change
    create_table :coberturas do |t|
      t.string :nome
      t.decimal :valor, precision: 10, scale: 2
      t.decimal :valor_franquia, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
