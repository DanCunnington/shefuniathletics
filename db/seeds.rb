# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
x = Admin.new(first_name: "Dan", email: "dcunnington1@sheffield.ac.uk", password: "password123",
				password_confirmation: "password123", super_admin: true)
x.save

y = Difficulty.new(grade: "Easy")
y.save

z = Difficulty.new(grade: "Medium")
z.save

a = Difficulty.new(grade: "Hard")
a.save

w = Event.new(description: "60m")
w.save

wa = Event.new(description: "60mH")
wa.save

b = Event.new(description: "100m")
b.save

c = Event.new(description: "110mH")
c.save

d = Event.new(description: "200m")
d.save

e = Event.new(description: "400m")
e.save

f = Event.new(description: "400mH")
f.save

g = Event.new(description: "800m")
g.save

h = Event.new(description: "1500m")
h.save

wb = Event.new(description: "3000m")
wb.save

wd = Event.new(description: "2000mSC")
wd.save

i = Event.new(description: "3000SC")
i.save

j = Event.new(description: "5000m")
j.save

k = Event.new(description: "10km")
k.save

l = Event.new(description: "4 x 100m Relay")
l.save

wc = Event.new(description: "4 x 200m Relay")
wc.save

m = Event.new(description: "4 x 400m Relay")
m.save

n = Event.new(description: "High Jump")
n.save

o = Event.new(description: "Long Jump")
o.save

p = Event.new(description: "Triple Jump")
p.save

q = Event.new(description: "Pole Vault")
q.save

r = Event.new(description: "Shot Put")
r.save

s = Event.new(description: "Javelin")
s.save

t = Event.new(description: "Discus")
t.save

u = Event.new(description: "Hammer")
u.save

v = Event.new(description: "Decathlon")
v.save

va = Event.new(description: "Heptathlon")
va.save


male_outdoor = EventType.new(description: "Male Outdoor")
male_outdoor.save

male_indoor = EventType.new(description: "Male Indoor")
male_indoor.save

female_outdoor = EventType.new(description: "Female Outdoor")
female_outdoor.save

female_indoor = EventType.new(description: "Female Indoor")
female_indoor.save