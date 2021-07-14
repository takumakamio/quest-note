# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  email: 'kudo@a',
  name: '工藤新一',
  introduction: '東の高校生探偵',
  image_id: nil,
  password: 'aaaaaa',
  password_confirmation: 'aaaaaa'
)

User.create!(
  email: 'hattori@a',
  name: '服部平次',
  introduction: '西の高校生探偵',
  image_id: nil,
  password: 'aaaaaa',
  password_confirmation: 'aaaaaa'
)

User.create!(
  email: 'haibara@a',
  name: '灰原哀',
  introduction: '組織の科学者',
  image_id: nil,
  password: 'aaaaaa',
  password_confirmation: 'aaaaaa'
)

User.create!(
  email: 'ran@a',
  name: '毛利蘭',
  introduction: '名探偵の娘',
  image_id: nil,
  password: 'aaaaaa',
  password_confirmation: 'aaaaaa'
)

Group.create!(
  group_name: '少年探偵団',
  admin_user: 1
)
Group.create!(
  group_name: '高校生探偵団',
  admin_user: 2
)

GroupUser.create!(
  group_id: 1,
  user_id: 1
)
GroupUser.create!(
  group_id: 2,
  user_id: 2
)

List.create!(
  group_id: 1,
  user_id: 1,
  title: '捜索'
)
List.create!(
  group_id: 1,
  user_id: 2,
  title: 'おつかい'
)

Quest.create!(
  user_id: 1,
  list_id: 1,
  quest_title: '三丁目の猫探し',
  quest_detail: '米花町の主である猫を探してほしいです',
  quest_status: '未',
  prize_money: 10_000,
  contractor_id: nil,
  contractor_name: nil,
  rate: nil,
  is_paid: false,
  start_date: '2022-07-10',
  end_date: '2022-07-11'
)

Quest.create!(
  user_id: 2,
  list_id: 2,
  quest_title: '小麦粉',
  quest_detail: 'たこ焼きって言ったら粉もんやろ',
  quest_status: '未',
  prize_money: 100,
  contractor_id: nil,
  contractor_name: nil,
  rate: nil,
  is_paid: false,
  start_date: '2022-07-10',
  end_date: '2022-07-15'
)
