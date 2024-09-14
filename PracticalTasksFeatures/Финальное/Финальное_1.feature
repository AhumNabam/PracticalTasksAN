﻿#language: ru

@tree

Функционал: Проверка возможности прикрепления файла картинки к элементу справочника "Товары"

Как специалист по работе с товарами я хочу
прикрепить изображения номенклатуры
чтобы убедиться в корректности работы данного функционала   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: 001_Прикрепление картинки в элемент справочника Товары
	И я закрываю все окна клиентского приложения
* Открытие товара
	Дано Я открываю навигационную ссылку "e1cib/data/Справочник.Товары?ref=8ca0000d8843cd1b11dc8cfecc6a7df2"
* Превдарительная очистка существующей картинки
	Когда открылось окно 'Кроссовки (Товар)'
	И я нажимаю кнопку очистить у поля с именем "ФайлКартинки"
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* Установка картинки	
	И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
	Тогда открылось окно 'Файлы'
	Если в таблице "Список" есть строка Тогда 
		| 'Наименование' |
		| 'Кроссовки' |
	Иначе 
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		И в поле с именем 'Наименование' я ввожу текст "Кроссовки"
		И я выбираю файл "$КаталогПроекта$\PracticalTasksFeatures\Финальное\КартинкаКроссковки.jpg"
		И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
		И Пауза 5		
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Кроссовки (Файл)" в течение 20 секунд
	И в таблице 'Список' я перехожу к строке:
		| "Наименование" |
		| "Кроссовки"    |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	И я нажимаю на кнопку с именем 'ОбновитьКартинку'
* Проверка
	И элемент формы с именем "ФайлКартинки" стал равен 'Кроссовки'
* Сохраняем
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна 'Кроссовки (Товар) *' в течение 20 секунд
