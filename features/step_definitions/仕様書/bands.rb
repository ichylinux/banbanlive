# coding: UTF-8

もし /^バンドの一覧を表示$/ do
  assert_visit '/bands'
end

もし /^バンドの登録画面に遷移$/ do
  assert_url '/bands/new'
end

もし /^バンドの参照画面に遷移$/ do
  assert_url '/bands/[0-9]+'
end

もし /^(ボーカル|ギター|ベース|キーボード|ドラム)を追加$/ do |instrument_name|
  within '#band_members' do
    click_on '追加'
    pause 1

    within all('tr')[-2] do
      select instrument_name, :from => find('select[name*="instrument_id"]')['id']
      click_on '未選択'
      pause 1
    end
  end

  within '#search_members_dialog' do
    case instrument_name
    when 'ボーカル'
      click_on 'うた田'
    when 'ギター'
      click_on 'ふぇん田'
    when 'ベース'
      click_on 'うっど'
    when 'キーボード'
      click_on '木田'
    when 'ドラム'
      click_on 'どらむす'
    end
  end

  capture
end

もし /^(.*?)に (.*?) を添付する$/ do |label, filename|
  attach_file label, "#{Rails.root}/test/data/#{filename}"
  capture
end
