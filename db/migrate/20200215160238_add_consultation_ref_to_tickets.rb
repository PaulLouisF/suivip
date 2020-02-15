class AddConsultationRefToTickets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :consultation, foreign_key: true
  end
end
