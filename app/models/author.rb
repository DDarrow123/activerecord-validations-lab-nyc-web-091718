class Author < ActiveRecord::Base

  validates :name, presence: true
  validates :phone_number, length: { is: 10 }
  validates :name, uniqueness: true
  
end

Author.create(name: "John Doe").valid? # => true
Author.create(name: nil).valid?

# Author.create(phone_number: 555305442).valid? # => true
# Author.create(phone_number: nil).valid?
