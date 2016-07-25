class Contact < ActiveRecord::Base
  def friendly_time
    updated_at.strfttime("%m/%d/%Y")
  end

  def full_name
    first_name + last_name
  end

  def pre_fix
    "+81" + phone_number
  end

  def self.all_john
    Contact.all.map{|contact| contact if contact.first_name.downcase == "john"}.compact
  end
end