ActiveRecord::Schema.define do
  self.verbose = false

  create_table :accounts, {force: true} do |t|
    t.string :name
    t.string :stripe_account_id
    t.string :country

    t.timestamps null: false
  end

  create_table :customers, {force: true} do |t|
    t.string :name
    t.string :stripe_customer_id
    t.references :account, index: true, foreign_key: true

    t.timestamps null: false
  end

  create_table :invoices, {id: false, force: true} do |t|
    t.string :id
    # t.references :customer, type: :string, index: true, foreign_key: true
    t.string :customer
    t.string :object
    t.string :amount_due
    t.integer :application_fee
    t.integer :attempt_count
    t.boolean :attempted
    t.string :charge
    t.boolean :closed
    t.string :currency
    t.integer :date
    t.string :description
    t.integer :discount
    t.integer :ending_balance
    t.boolean :forgiven
    t.jsonb :lines
    t.boolean :livemode
    t.jsonb :metadata
    t.integer :next_payment_attempt
    t.boolean :paid
    t.integer :period_end
    t.integer :period_start
    t.string :receipt_number
    t.integer :starting_balance
    t.string :statement_descriptor
    t.integer :subscription #?
    t.integer :subtotal
    t.integer :tax
    t.decimal :tax_percent
    t.integer :total
    t.integer :webhooks_delivered_at
  end
  execute "ALTER TABLE invoices ADD PRIMARY KEY (id);"

  # create_table :invoice_items, {id: false, force: true} do |t|
  #   t.string :id
  #   t.string :object
  #   t.integer :amount
  #   t.string :customer
  #   t.integer :date
  #   t.string :description
  #   t.boolean :discoutable
  #   t.string :invoice
  #   t.boolean :livemode
  #   t.jsonb :metadata
  #   t.jsonb :period
  #   t.boolean :proration
  #   t.integer :quantity
  #   t.string :subscription
  # end
  # execute "ALTER TABLE invoice_items ADD PRIMARY KEY (id);"
end
