class AddDurationToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :duration, :integer
  end
end
