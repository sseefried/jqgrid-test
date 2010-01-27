# -*-ruby-*-

namespace :db do
  desc "Blow away the database and populate with some basic data"
  task :initialise => [ "db:drop", "db:create", "db:migrate" ] do
    (1..50).each do |i|
      Product.create({:name => "Product #{i}", :description => "The #{i.ordinalize} product",
                       :quantity => (3 * i % 13 + 1), :price => 7 * i % 10 + (11 * i.to_f / 100),
                       :available => (i % 2 == 0) })
    end
  end
end
