class UpdateFeaturedImageColumnTypeIntoPost < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :featured_image, :text
  end
end