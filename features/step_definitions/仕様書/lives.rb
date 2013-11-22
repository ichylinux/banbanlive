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

もし /^エントリーに (.*?) を追加$/ do |band_name|
  assert page.has_no_selector?('.ui-datepicker-div', :visible => true)

  within '#entries' do
    click_on '追加'
    pause 1

    within all('tr')[-2] do
      click_on '未選択'
      pause 1
    end
  end

  within '#search_bands_dialog' do
    click_on band_name
  end

  capture
end
