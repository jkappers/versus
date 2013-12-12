admin = User.create({
  email:    'jkappers@kalkomey.com',
  password: 'password'
})

admin.group = Group.create({
  name: "Kalkomey",
  creator: admin
})

admin.save!

mike = User.create({
  email:    'mmayo@kalkomey.org',
  password: 'password'
})

Game.create(winner: admin, loser: mike)
Game.create(winner: admin, loser: mike)
Game.create(winner: mike, loser: admin)
