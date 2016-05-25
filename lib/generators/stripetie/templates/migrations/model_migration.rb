class AddStripeModels < ActiveRecord::Migration
  def change
    create_table :invoices do |t|

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
