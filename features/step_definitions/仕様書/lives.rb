# coding: UTF-8

もし /^ライブの一覧を表示$/ do
  assert_visit '/lives'
end

もし /^ライブの登録画面に遷移$/ do
  assert_url '/lives/new'
end

もし /^ライブの参照画面に遷移$/ do
  assert_url '/lives/[0-9]+'
end
