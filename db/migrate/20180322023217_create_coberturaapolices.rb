class CreateCoberturaapolices < ActiveRecord::Migration
  def change
    create_table :coberturaapolices do |t|
      t.references :apolice, index: true, foreign_key: true
      t.references :cobertura, index: true, foreign_key: true
      t.decimal :valor, precision: 10, scale: 2
      t.decimal :valor_franquia, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
