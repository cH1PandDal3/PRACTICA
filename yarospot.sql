DROP TABLE IF EXISTS team_posts CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS clothes CASCADE;
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
    user_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL 
);

CREATE TABLE clothes (
    clothe_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    price_per_day DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE orders (
    order_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    client_id INT,
    clothe_id INT,
    rent_date DATE NOT NULL,
    FOREIGN KEY (client_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (clothe_id) REFERENCES clothes(clothe_id) ON DELETE CASCADE
);

CREATE TABLE team_posts (
    post_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    creator_id INT,
    title TEXT NOT NULL, 
    event_date DATE NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users(user_id) ON DELETE CASCADE
);

INSERT INTO users (full_name, role, phone) VALUES 
('Антон Кузнецов', 'Оператор', 'Москва'),
('Игорь Петров', 'Оператор', 'Казань'),
('Дмитрий Власов', 'Оператор', 'Москва'),
('Сергей Назаров', 'Оператор', 'Екатеринбург'),
('Мария Степанова', 'Модель', 'Санкт-Петербург'),
('Алиса Соколова', 'Модель', 'Москва'),
('Елизавета Львова', 'Модель', 'Москва'),
('Кирилл Морозов', 'Модель', 'Санкт-Петербург');

INSERT INTO clothes (title, price_per_day, status, owner_id) VALUES 
('Вечернее платье «Marsala»', 2500.00, 'Свободно', 6),
('Костюм-двойка «Navy Classic»', 3200.00, 'Свободно', 6),
('Шёлковая блуза «Cream»', 1400.00, 'Свободно', 6),
('Коктейльное платье «Noir»', 1800.00, 'В аренде', 6),
('Пальто-оверсайз «Camel»', 2100.00, 'Свободно', 6),
('Брюки прямые «Bordo»', 1200.00, 'Свободно', 6),
('Брючный костюм «Smoky»', 2800.00, 'Свободно', 6),
('Свитер «Knit Wool»', 900.00, 'Свободно', 6),
('Кожаная куртка «Rider»', 1600.00, 'В аренде', 6);

INSERT INTO orders (client_id, clothe_id, rent_date) VALUES 
(1, 4, '2026-06-01'), 
(3, 9, '2026-06-02'); 

INSERT INTO team_posts (creator_id, title, event_date) VALUES 
(1, 'Ищу модель на коммерческую съёмку для бренда одежды. Снимаем 2 дня в студии «Loft 32», нужен опыт работы с лукбуками.', '2026-06-05'),
(2, 'Набираю кастинг моделей на серию редакционных съёмок. Интересны нестандартные типажи. Локации — центр Казани, лофт.', '2026-06-12'),
(3, 'Снимаю серию имидж-роликов для шоурума. Нужна модель с уверенной пластикой и опытом работы перед камерой. Дата — суббота.', '2026-06-06'),
(4, 'Запускаю съёмку для уличного бренда: upper одежда, аксессуары. Нужна модель в стиле «городской минимализм». Локации согласуем.', '2026-06-15'),
(5, 'Готова к сотрудничеству с фотографами и видеографами. Есть портфолио, опыт показов. Открыта к лукбукам, бьюти-проектам и тестам.', '2026-06-01'),
(6, 'Ищу фотографа для съёмки эстетичного портфолио — нужны 3–4 образа в одной локации. Готова обсудить TFP или оплату.', '2026-06-08'),
(7, 'Свободна по будням во второй половине дня. Опыт работы с локальными брендами одежды и украшений. Есть карточка модели.', '2026-06-02'),
(8, 'Открыт к работе с операторами и брендами. Есть опыт в каталожной съёмке и видео. Возьмусь за съёмки в СПб и Москве.', '2026-06-20');
