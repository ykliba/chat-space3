class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.string :image
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
      # references型で設定してあるので、カラム名に_idは不要
    end
  end
end
