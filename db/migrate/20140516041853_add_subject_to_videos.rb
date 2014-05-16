class AddSubjectToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :subject, :string
  end
end
