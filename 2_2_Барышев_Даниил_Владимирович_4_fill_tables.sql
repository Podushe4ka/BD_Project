begin transaction;
INSERT INTO Library.Locations (Opening_hours, Address) VALUES 
('09:00-18:00', 'Наб. реки Фонтанки, 44'), 
('12:00-16:00', 'Большая Конюшенная ул., 31'),
('09:00-18:00', 'пер. Крылова, 4'),
('10:00-20:00', 'Большая Морская ул., 33'),
('09:00-20:00', 'Садовая ул., 16');

INSERT INTO Library.Books (name, author, genre, Year_of_publication) VALUES
('Гамлет', 'У. Шекспир', 'Трагедия', 1603),
('1984', 'Д. Оруэлл', 'Антиутопия', 1949),
('Фауст', 'И.В. Гёте', 'Драма', 1808),
('Три мушкетёра', 'А. Дюма', 'Историческая проза', 1844),
('Горе от ума', 'А. Грибоедов', 'Комедия', 1825),
('Евгений Онегин', 'А. Пушкин', 'Роман', 1833),
('Ревизор', 'Н. Гоголь', 'Комедия', 1836);

INSERT INTO Library.Employees (Full_name, Role, Date_of_hire) VALUES
('Александр Кочетков', 'Главный библиотекарь', '2015-06-01'),
('Дмитрий Крылов', 'Главный библиотекар', '2016-09-15'),
('Елизавета Чередникова', 'Ассистент', '2017-11-20'),
('Владислав Зелёный', 'Главный библиотекарь', '2018-03-10'),
('Александр Поздний', 'Главный библиотекарь', '2019-07-25'),
('София Тихонова', 'Главный библиотекарь', '2020-01-30'),
('Максим Серый', 'Ассистент', '2021-02-19');

INSERT INTO Library.Readers (Full_name, Contact_info, Date_of_registration) VALUES
('Михаил Островский', '+79073627229', '2017-01-20'),
('Владимир Чепуркин', '+79476689729', '2019-02-22'),
('Николай Басков', '+79563755312', '2015-09-01'),
('Анна Карпова', '+79152238789', '2016-12-05'),
('Дарья Волкова', '+79882345454', '2020-04-12');

INSERT INTO Library.location_x_employee VALUES
(1, 2),
(2, 6),
(3, 1),
(4, 5),
(5, 4),
(5, 3),
(1, 7);

INSERT INTO Library.Reviews (ID_Reader, ID_Book, Grade, Short_description) VALUES
(1, 1, 3, 'Не понял всего ажиотажа вокруг этой книги'),
(2, 3, 5, 'Глубокая драма, обязательно к прочтению'),
(3, 5, 4, 'Концовка подвела, ожидал большего'),
(4, 6, 3, 'Очень долго и монотонно'),
(5, 7, 5, 'Веселая сатира, рекомендую');

INSERT INTO Library.Checkouts (ID_Reader, ID_Book, ID_Employee, ID_Location, Checkout_date, Return_date, Return_period) VALUES
(1, 1, 6, 2, '2017-01-20', '2017-02-28', 3),
(2, 3, 5, 4, '2019-02-22', '2019-04-20', 4),
(3, 5, 4, 5, '2015-09-01', '2015-09-10', 4),
(4, 6, 1, 3, '2016-12-05', '2017-02-05', 3),
(5, 7, 2, 1, '2020-04-12', '2020-04-20', 3);
commit;
