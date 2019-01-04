require_relative './../../config/init.rb'

class AnswerCreate < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
        t.text :answer
        t.belongs_to :question
        t.belongs_to :user
        t.integer :total_vote, :default => 0
        t.timestamps
    end
  end
end
