# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'    

# offset = 0
# csv_text = File.read('ww.csv')
# csv = CSV.parse(csv_text, :headers => true, :quote_char => "\'", :col_sep => "&")
# csv.each do |row|
#   data = row.to_hash
#   if data["_id"].to_i > offset
#   	next
#   end
# end
  
#   blog = Blog.find(data["_id"].to_i)
#   if row.to_hash["content"] != blog.content
#   	blog.update(title: data["title"], content: data["content"])
#   	puts "blog #{data["_id"]} updated"
#   end
# end

# Blog.where(_id: data["_id"].to_i).each do |blog|
#   	puts "blog #{data["_id"]} ff"
# 	  if row.to_hash["content"] != blog.content
# 	  	blog.update(title: data["title"], content: data["content"])
# 	  	puts "blog #{data["_id"]} updated"
# 	  end
# 	end

csv_text = File.read('db/blog.csv')
csv = CSV.parse(csv_text, :headers => true, :quote_char => "\'", :col_sep => "&")
csv.each do |row|
  Blog.create!(row.to_hash)
end

csv_text = File.read('db/record.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Record.create!(row.to_hash)
end


# csv_text = File.read('darvish_npb.csv')
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   StatsNpb.create!(row.to_hash)
#end


# puts 'ROLES'
# YAML.load(ENV['ROLES']).each do |role|
#   Role.find_or_create_by(name: role)
#   puts 'role: ' << role
# end
# puts 'DEFAULT USERS'
# user = User.find_or_create_by(email: ENV['ADMIN_EMAIL'].dup, password: ENV['ADMIN_PASSWORD'].dup, password_confirmation: ENV['ADMIN_PASSWORD'].dup)
# user.add_role :admin
# puts 'user: ' << user.email
