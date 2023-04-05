class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      #作品名
      t.string :item_name
      #製作者コメント
      t.string :explanation
      #いいね数
      t.integer :nice
      #コメント
      t.string :comment

      t.timestamps
    end
  end
end
