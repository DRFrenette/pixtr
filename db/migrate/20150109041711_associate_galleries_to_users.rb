class AssociateGalleriesToUsers < ActiveRecord::Migration
  def change
    add_reference :galleries, :user
  end
end
