class AddParsedHtmlToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :html, :text
  end

  def down
    remove_column :posts, :html
  end
end
