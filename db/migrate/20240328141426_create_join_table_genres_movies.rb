class CreateJoinTableGenresMovies < ActiveRecord::Migration[7.1]
  def change
    create_join_table :genres, :movies do |t|
    end
  end
end
