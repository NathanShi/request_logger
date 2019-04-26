class CreateRequestLog < ActiveRecord::Migration
  def self.up
    create_table :request_logger do |t|
      t.string :destination_code, :index => true, :null => false
      t.string :request_method, :null => false
      t.string :request_url, :null => false
      t.integer :response_status_code
      t.text :response_body
      t.integer :response_duration_ms
      t.boolean :timeout, :default => false
      t.text :context
      t.timestamps
    end

    add_index :request_logger, [:request_method, :request_url], name: 'index_on_request_method_and_url'
    add_index :request_logger, [:request_method, :response_status_code], name: 'index_on_request_method_and_response_code'
  end

  def self.down
    drop_table :request_logger
  end
end
