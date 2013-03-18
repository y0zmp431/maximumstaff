
# encoding: utf-8
# language: ru
Функционал: Операции над пользователями

Управление пользователями и правами досупа.
  
  Сценарий: Для регистрации пользователя достаточно указать email и пароль 
		Допустим я администратор
		Если создан пользователь с:
			| email     | test@tester.by | 
			| password  | password | 
			| password_confirmation | password | 
		То пользователь с email "test@tester.by" с паролем "password" сможет войти на сайт

	Сценарий: Пользователь может зарегистрироваться сам
		Допустим я не зарегистрированный пользователь
		Если создан пользователь с:
			| email | test@tester.by | 
			| password | password | 
			| password_confirmation | password | 
		То пользователь с email "test@tester.by" с паролем "password" сможет войти на сайт

  Сценарий: Нельзя создать пользователя без email
		Допустим я администратор
		Если я создаю пользователя указывая след. данные:
			| password | password | 
			| password_confirmation | password | 
		То должен увидеть ошибку "Еmail должен быть правильным адресом электронной почты"
		#То должен увидеть ошибку "Не указан email"

  Сценарий: Нельзя создать пользователя без пароля
		Допустим я администратор
		Если я создаю пользователя указывая след. данные:
			| email | password | 
		То должен увидеть ошибку "Пароль недостаточной длины"

  Сценарий: Нельзя создать пользователя указав разные пароли 
		Допустим я администратор
		Если я создаю пользователя указывая след. данные:
			| email | password | 
			| password | password | 
			| password_confirmation | password1 | 
		То должен увидеть ошибку "Пароль не совпадает с подтверждением"


  Сценарий: По умолчанию создается активный пользователь с правами простого пользователя
		Допустим я на странице Регистрация
		Если я ввожу следующие значения: 
		  | name           | value        |
			| user[login]    | new_user     |
			| user[email]    | new@gmail.com|
			| user[password] | password     |
			| user[password_confirmation] | password     |
			| user[name]     | Василий Андреевич     |
			И кликаю кнопку "Регистрация"
		То должен быть создан новый пользователь "new_user" с:
		  | name     | value        |
			| email    | new@gmail.com|
			| name     | Василий Андреевич     |
			| disabled | false |
			И у пользователя "new_user" должны быть привелегии:
				| user |
			И пользователь "new_user" с паролем "password" сможет войти на сайт
		

  Сценарий: Администратор редактирует информацию о пользователe.
  Сценарий: Администратор удаляет пользователя(пользователя нельзя удалить окончательно).
  Сценарий: Администратор изменяет привелегии пользователя
  Сценарий: Пользователь редактирует информацию о себе.
  Сценарий: Пользователь пытается изменить не свою информацию.
  Сценарий: Пользователь пытается удалить другого пользователя.
  Сценарий: Пользователь не доступна работа с привелегиями 
  Сценарий: По умолчанию на странице видны только активные пользователи, но можно включить отображение всех.


