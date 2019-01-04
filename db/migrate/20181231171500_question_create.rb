require_relative './../../config/init.rb'

class QuestionCreate < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :question
      t.belongs_to :user
      t.timestamps
    end
  end
end
