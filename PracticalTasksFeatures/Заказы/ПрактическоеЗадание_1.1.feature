﻿#language: ru

@tree

Функционал: тест на проверку расчета суммы документа Заказ (подсистема Продажи) при изменении количества и цены

Контекст:
 Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий: изменение данных тч в документе заказ 
// Редактирование документа заказ
Как Менеджер по продажам я хочу
* Открытие формы существующего документа Заказы
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Тогда открылось окно "Заказы товаров"
	И в таблице 'Список' я активизирую поле с именем 'Покупатель'
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ * от *"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "50,00"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "200"
	И в таблице 'Товары' я перехожу к строке:
		| "Количество" | "Сумма"    | "Товар"   | "Цена"  |
		| "50"         | "2 750,00" | "Ряженка" | "55,00" |
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "100,00"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "70"
	И в таблице 'Товары' я завершаю редактирование строки
	* Проверка заполнения тч товары
	И таблица 'Товары' содержит строки:
			| "Количество" | "Сумма"    | "Товар"   | "Цена"  |
			| "200"        | "10 000,00" | "Масло" | "50,00" |
			| "70"         | "7 000,00" | "Ряженка" | "100,00" |
	* Закрываю форму без сохранения		
	И Я закрываю окно "Заказ * от * *"
	Тогда открылось окно "1С:Предприятие"
	И я нажимаю на кнопку с именем 'Button1'
					