# coding: UTF-8

もし /^メンバーの一覧を表示$/ do
  assert_visit '/members'
end

もし /^メンバーの登録画面に遷移$/ do
  assert_url '/members/new'
end

もし /^メンバーの参照画面に遷移$/ do
  assert_url '/members/[0-9]+'
end
