class CreateMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :marks do |t|
      t.float :points
      t.string :letter
      t.belongs_to :report, index: true
    end
  end
end
