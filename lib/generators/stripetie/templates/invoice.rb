class Invoice < ActiveRecord::Base
  belongs_to :customer

  acct_cname = Stripetie::ACCOUNT_CLASS ? Stripetie::ACCOUNT_CLASS.downcase : 'account'

  scope :by_customer, ->(customer_id) {
    where(customer: Customer.find(customer_id).stripe_customer_id)
  }

  acct_scope_name = "by_#{acct_cname}".to_sym
  scope acct_scope_name, ->(account_id) { #! Make :by_account also a dynamic scope name
    joins('JOIN customers ON customers.stripe_customer_id = invoices.customer')
    joins("JOIN #{acct_cname}s ON #{acct_cname}s.id = customers.#{acct_cname}_id")
    .where("#{acct_cname}s.id = ?", account_id)
  }
end
