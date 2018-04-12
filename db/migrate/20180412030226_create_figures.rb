class CreateFigures < ActiveRecord::Migration[5.1]
  def change
    create_table :figures do |t|
      t.string :name
    end#do
  end#change
end#CreateFigures
