admin = User.create({
  email:    'jkappers@kalkomey.com',
  password: 'password'
})

admin.group = Group.create({
  name: "Kalkomey",
  creator: admin
})

admin.save!
