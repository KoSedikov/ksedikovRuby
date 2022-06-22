# frozen_string_literal: true
require 'win32ole'
$global_text = ""


When(/^пользователь заходит на страницу "(.+?)"$/) do |url|
  visit url
  $logger.info("Страница #{url} открыта")
  sleep 1
end

When(/^пользователь нажал на вкладку "([^"]*)"$/) do |text|
  download_tab = find("//div[@id='header']//div[@class='site-links']//a[text()='#{text}']")
  download_tab.click
  $logger.info("Пользователь перешел на страницу https://www.ruby-lang.org/ru/downloads/")
  sleep 1
end

When(/^пользователь нажал на ссылку инсталлера "([^"]*)"$/) do |installer|
  installer_link = find("//div[@id='content']//a[text()='#{installer}']")
  installer_link.click
  $logger.info("Пользователь перешел на страницу https://https://rubyinstaller.org/")
  sleep 1
end

When(/^пользователь нажал на кнопку скачивания$/) do
  download_button = find("//div[@id='download_btn']//a[@href='/downloads/']")
  download_button.click
  $logger.info("Пользователь перешел на страницу https://rubyinstaller.org/downloads/")
  sleep 1
end

When (/^пользователь нажал на последний рекомендованный релиз$/) do
  release_button = find("//div[@id='download-links']//ul//li[@class='ridkexe']//a[@class='downloadlink download-recommended']")
  $global_text = release_button.text
  release_button.click
  $logger.info("Выбор директории для скачивания")
  sleep 1
end

When(/^пользователь сохранил файл$/) do
  wsh = WIN32OLE.new('Wscript.Shell')
  wsh.AppActivate('Save As')
  wsh.SendKeys('{ENTER}')
end

When(/^сравнивается версия скачанного файла и версия на странице$/) do

end




When(/^ввожу в поисковой строке текст "([^"]*)"$/) do |text|
  query = find("//input[@name='q']")
  query.set(text)
  query.native.send_keys(:enter)
  $logger.info('Поисковый запрос отправлен')
  sleep 1
end


When(/^я должен увидеть текст на странице "([^"]*)"$/) do |text_page|
  sleep 1
  expect(page).to have_text text_page
end

