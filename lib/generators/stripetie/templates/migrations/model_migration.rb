class AddStripeModels < ActiveRecord::Migration
  def change
    create_table :invoices, {id: false, primary_key: :id} do |t|
      t.string :id
      t.string :object
      t.string :amount_due
      t.integer :application_fee
      t.integer :attempt_count
      t.boolean :attempted
      t.string :charge
      t.boolean :closed
      t.string :currency
      t.string :customer
      t.integer :date
      t.string :description
      t.integer :discount
      t.integer :ending_balance
      t.boolean :forgiven
      t.jsonb :lines
      t.boolean :livemode
      t.bson :metadata
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

    create_table :invoice_items do |t|

    end

    create_table :balance_transactions do |t|

    end

    create_table :refunds do |t|

    end

    create_table :charges do |t|

    end
  end
end
