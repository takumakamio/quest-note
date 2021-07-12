json.array!(@client_quests) do |quest|
  json.extract! quest, :id
  json.title quest.quest_title
  json.start quest.start_date
  json.end quest.end_date
  json.url group_list_quest_url(quest.list.group, quest.list, quest)
end

json.array!(@contractor_quests) do |quest|
  json.extract! quest, :id
  json.title quest.quest_title
  json.start quest.start_date
  json.end quest.end_date
  json.color "#ff0000"
  json.url group_list_quest_url(quest.list.group, quest.list, quest)
end