class AddEpisodeIdToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :episode_id, :integer
  end
end
