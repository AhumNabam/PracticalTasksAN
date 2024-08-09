﻿
#language: ru

@tree

Функционал: тест на то, что при добавлении Услуги в документ Заказ (подсистема Продажи) в поле Количество можно ввести значение

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Редактирование поля количество в заказе
//
Как Менеджер по продажам я хочу
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Тогда открылось окно "Заказы товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Заказ (создание)"
	И я нажимаю кнопку выбора у поля с именем 'Организация'
	И из выпадающего списка с именем 'Организация' я выбираю по строке "м"
	И из выпадающего списка с именем 'Покупатель' я выбираю по строке "м"
	И я нажимаю кнопку выбора у поля с именем 'Склад'
	И из выпадающего списка с именем 'Склад' я выбираю по строке "м"
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю по строке "рем"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
* Проверка доступности
 	И в таблице 'Товары' я выбираю текущую строку  	 
	// не пойму как заблокировано поле. оно доступно на изменение и на просмотр, проверки типа "доступно" не срабатывают. исключение тоже не срабатывает
	попытка
 	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "2,00"
	Исключение
	И я вызываю исключение "Не удалось записать количество в товары"
	
