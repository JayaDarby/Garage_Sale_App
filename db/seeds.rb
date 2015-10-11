# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



a = Item.create(name:'Baseball Card Collection', price: 85.75, description:'Topps Museum Collection Baseball Cards Mint Condition Rare!!', 
	full_address: '19 Rebecca Ln, San Francisco, CA 94124', image_url: 'http://portasite.com/wp-content/uploads/topps1969-260f.jpg');

b = Item.create(name:'Elkornes Stressless Couch', price: 945.45, description:'Elkornes Stressless Eldorado 3-seat couch. Brown leather. Approximately 7-8 years old, nearly perfect condition (3 small nicks/blemishes). Fully working order - all three reclining sections function well.', 
	full_address:'4146 22nd St, San Francisco, CA 94114', image_url:'http://img.class.posot.es/en_gb/2015/01/27/STRESSLESS-EKORNES-SOFA-20150127072116.jpg')

c = Item.create(name:' Ashley Furniture Dinelle couch and love seat set for sale', price: 756.25, description:'I am selling the Ashley furniture Dinelli charcoal couch set which includes the sofa and love seat and pillows. The couches were purchased less than a year ago and were brand new', 
	full_address:'333 1st St, San Francisco, CA 94105', image_url:'http://i.imgur.com/dr7GxTD.jpg')

d = Item.create(name:'Vintage Wooden Baby Crib', price: 135.85, description:"This was my mother's baby crib from 1927. It had been stored in our spare room and is in very good vintage condition. The complete crib is original except for 8 screws.", 
	full_address:'333 1st St, San Francisco, CA 94105', image_url:'http://images1.americanlisted.com/nlarge/portable-wooden-crib-and-wooden-rocking-chair-americanlisted_33926995.jpg')

e = Item.create(name:'Schwinn Legacy Cruiser Bike', price: 115.75, description:"A comfortable ride is built in with a spring Schwinn seat and upright riding position. Coordinating fenders, seat and chain cover. No gears or cables to worry about because it's single speed. This bike has been tuned to run like new", 
	full_address:'4146 22nd St, San Francisco, CA 94114', image_url:'http://images1.americanlisted.com/nlarge/bicycle-used-schwinn-26-inch-cruiser-supreme-red-5-speed-americanlisted_33517471.jpg')


f = GarageSale.create(full_address: '333 1st St, San Francisco, CA 94105', address: '333 1st St', city: 'San Francisco', state: 'CA', zip_code: 94105, 
	image_url: 'http://modularhomeowners.com/wp-content/uploads/2013/07/garagesale3.jpg', title: 'Kids Toys and Clothes For Sale!!', description:
	'My babies are all grown up and are ready to part with the toys from their childhood. Come and witness the closing scene in Toy Story 3.',
	phone_number: 9253347626, email: 'lisasimpson@gmail.com', has_items: true)
g = GarageSale.create(full_address:'4146 22nd St, San Francisco, CA 94114', address:'4146 22nd St', city:'San Francisco', state:'CA', zip_code: 94114, 
	image_url: 'http://dogwooddealer.com/images/blog_posts/pic11.jpeg', title:'Moving Sale! Everything MUST go!', description:
	'My husband got a new job so we are moving and we need everything gone!!! We have dishes, books, home decor, and more!! Come on by!',
	phone_number:4157682250, email:'orangecountytrooper@yahoo.com', has_items: true)
h = GarageSale.create(full_address:'19 Rebecca Ln, San Francisco, CA 94124', address:'19 Rebecca Ln', city:'San Francisco', state:'CA', zip_code:94124, 
	image_url:'http://thefuntimesguide.com/images/blogs/leftover-yard-sale-items.jpg', title:'Yard Sale! Baseball Card Collection, tools, and more!!',
	description:'We are finally getting rid of all the extra junk lying around our place. We have a pretty rare baseball card collection if anyone out there collects.',
	phone_number:4087651998, email:'mattdrew789@gmail.com', has_items:true)
i = GarageSale.create(full_address:'310 Montcalm St, San Francisco, CA 94110', address:'310 Montcalm St', city:'San Francisco', state:'CA', zip_code:94110, 
	image_url:'http://si.wsj.net/public/resources/images/NA-BO759_GARAGE_G_20111229190236.jpg', title:'Estate Sale San Francisco',
	description:'My mother has passed away and has left behind beautiful antiques and furniture. I love a lot of the items but I simply do not have room for them.',
	phone_number:4153420963, email:'trinitystarmadonna@aol.com', has_items:false)
j = GarageSale.create(full_address:'4142 Folsom St, San Francisco, CA 94110', address:'4142 Folsom St', city:'San Francisco', state:'CA', zip_code:94110, 
	image_url:'http://www.yourlocalmovers.com.au/wp-content/uploads/2015/08/Brisbane-Garage-Sale.jpg', title:'Garage Sale! Lots of cheap stuff',
	description:'Books, clothes, bedding and more. First come first serve.',
	phone_number:9254409326, email:'henrycostaaa98@gmail.com', has_items:false)

f.items << c
f.items << d
g.items << e
g.items << b
h.items << a


first = DurationTime.create(start_time: Time.new(1993, 02, 24, 8, 0, 0), end_time:Time.new(1993, 02, 24, 14, 0, 0), date: Time.new(2015,8,5))
second = DurationTime.create(start_time: Time.new(1993, 02, 24, 7, 0, 0), end_time: Time.new(1993, 02, 24, 13, 0, 0), date: Time.new(2015,8,5))
third = DurationTime.create(start_time: Time.new(1993, 02, 24, 9, 0, 0), end_time: Time.new(1993, 02, 24, 15, 0, 0), date: Time.new(2015,8,6))
fourth = DurationTime.create(start_time: Time.new(1993, 02, 24, 8, 0, 0), end_time:Time.new(1993, 02, 24, 14, 0, 0), date: Time.new(2015,8,6))
fifth = DurationTime.create(start_time: Time.new(1993, 02, 24, 9, 0, 0), end_time: Time.new(1993, 02, 24, 15, 0, 0), date: Time.new(2015,8,7))
sixth = DurationTime.create(start_time: Time.new(1993, 02, 24, 7, 0, 0), end_time: Time.new(1993, 02, 24, 14, 0, 0), date: Time.new(2015,8,7))

f.duration_times << first << third
g.duration_times << second << third
h.duration_times << fourth << fifth
i.duration_times << second << fourth << sixth
j.duration_times << first << third << fifth

a.duration_times << fourth << fifth
b.duration_times << second << third
c.duration_times << first << third
d.duration_times << first << third
e.duration_times << second << third


