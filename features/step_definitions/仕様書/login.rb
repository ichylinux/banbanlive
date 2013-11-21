# coding: UTF-8

前提 /^ログインしている$/ do
  u = User.first
  sign_in u.email
end
