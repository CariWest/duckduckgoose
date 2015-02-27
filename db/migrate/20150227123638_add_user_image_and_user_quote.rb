class AddUserImageAndUserQuote < ActiveRecord::Migration
  def change
    add_column :users, :quote, :string, :default => DbcFaker::Quote.quote
    add_column :users, :image, :string, :default => "https://avatars3.githubusercontent.com/u/4805277?v=3&s=460"
     end
end
