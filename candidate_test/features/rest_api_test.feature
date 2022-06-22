# encoding: UTF-8
# language: ru

#Readme
# Данный тест - проверка навыков работы с REST API
# Мы используем Gem RestClient
# Для облегчения работы в тесте есть обертка над этим гемом features/support/helpers/rest_wrapper.rb

# Ваша задача
# 1. Реализовать шаг удаления пользователя по логину ( логин - уникальный параметр для пользователя)
# 2. Реализовать шаг изменения доступных параметров пользователя по логину
# 3. Провести исследовательское тестирование работы реализованных REST API сервисов (независимо и в связках)

Функция: REST API

  Сценарий: Работа с пользователями через REST API

    Дано получаю информацию о пользователях

    И проверяю наличие логина i.ivanov в списке пользователей
    И проверяю отсутствие логина f.akelogin в списке пользователей

    Тогда добавляю пользователя c логином t.task именем testing фамилией task паролем Qwerty123@
   # И       удаляю пользователя c логином t.task именем testing фамилией task паролем Qwerty123@
    #И нахожу пользователя с логином t.task