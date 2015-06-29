class AddImageFileNameDirectorToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :director, :string
    add_column :movies, :image_file_name, :string
  end
end
