class AddPositionToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :position, :string
  end
end
