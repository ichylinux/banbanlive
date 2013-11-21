# coding: UTF-8

もし /^管理画面を表示する$/ do
  assert_visit '/admin'
end

ならば /^管理メニューが表示される$/ do
  assert page.has_selector?('ul')
end
