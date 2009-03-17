ActiveRecord::Schema.define(:version => 1) do

  create_table :widgets, :force => true do |t|
    t.column :title, :string, :limit => 50
    t.column :deleted_at, :timestamp
  end

end