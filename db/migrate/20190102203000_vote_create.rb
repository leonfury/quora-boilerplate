require_relative './../../config/init.rb'

class VoteCreate < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
        t.integer :vote, :default => 0
        t.belongs_to :answer
        t.belongs_to :user
        t.timestamps
    end
  end
end
