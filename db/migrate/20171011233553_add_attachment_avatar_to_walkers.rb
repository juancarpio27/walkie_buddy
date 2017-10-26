class AddAttachmentAvatarToWalkers < ActiveRecord::Migration
  def self.up
    change_table :walkers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :walkers, :avatar
  end
end
