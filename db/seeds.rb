%w[root bcast shidur moder group haver guest].each do |r|
  Role.create name: r
end

root = Role.find_by(name: 'root')
group = Role.find_by(name: 'group')

User.create name: 'Йозеф Юдилевич', role: root, password: '1234567890', email: 'yosef.yudilevich@gmail.com'
User.create name: 'Дмитрий Пекаровский', role: root, password: '1234567890', email: 'dimitri.pekarovsky@gmail.com'

%w[Moscow StPetersburg Sochi Kiev Odessa Kaliningrad NewYork].each do |u|
  User.create name: u, role: group, password: '1234567890', email: "#{u}@gmail.com"
end
