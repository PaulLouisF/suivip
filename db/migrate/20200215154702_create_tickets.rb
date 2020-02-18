class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :question
      t.string :answer
      t.bigint :asking_user_id
      t.bigint :answering_user_id

      t.timestamps
    end
  end
end
