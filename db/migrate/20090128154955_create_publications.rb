class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.string :title
			t.references :venue
    end

    create_table :authorships, :force => true do |t|
      t.references :author
      t.references :publication
    end

    create_table :authors, :force => true do |t|
      t.string :first_name
			t.string :middle_names
			t.string :last_name
    end

    create_table :venues, :force => true do |t|
      t.string :name
			t.date :date
    end
  end

  def self.down
    drop_table :venues
    drop_table :authors
    drop_table :authorships
    drop_table :publications
  end
end
