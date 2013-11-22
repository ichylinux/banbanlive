# coding: UTF-8

ならば /^管理メニューが表示される$/ do
  assert page.has_selector?('ol')
  assert page.find('ol').text.include?('メンバーの管理')
  assert page.find('ol').text.include?('バンドの管理')
end
