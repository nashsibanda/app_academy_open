class ChangeBandIdToBeIntegerInAlbums < ActiveRecord::Migration[5.2]
  def change
    change_column :albums, :band_id, 'integer USING CAST(band_id AS integer)'
  end
end
