class AddColoumToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :contact_number, :string
    add_column :articles, :email_id, :string
    add_column :articles, :college_name, :string
  end
end
