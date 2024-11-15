create database if not exists `Kulüpler` default charset utf8mb4 collate utf8mb4_turkish_ci;
use Kulüpler;

create table if not exists Top_Clubs (
    club_id INT AUTO_INCREMENT PRIMARY KEY,
    club_name VARCHAR(100) NOT NULL,
    league_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    championships INT DEFAULT 0,
    budget_million_eur DECIMAL(10, 2) DEFAULT 0.00
);
/*
INSERT INTO Top_Clubs (club_name, league_name, country, championships, budget_million_eur) VALUES
    ('Manchester City', 'English Premier League', 'England', 9, 1050.00),
    ('Manchester United', 'English Premier League', 'England', 20, 850.00),
    ('Liverpool', 'English Premier League', 'England', 19, 925.00),
    ('Arsenal', 'English Premier League', 'England', 13, 800.00),

    ('Real Madrid', 'La Liga', 'Spain', 35, 1050.00),
    ('Barcelona', 'La Liga', 'Spain', 26, 950.00),
    ('Atletico Madrid', 'La Liga', 'Spain', 11, 600.00),
    ('Sevilla', 'La Liga', 'Spain', 1, 300.00),

    ('Bayern Munich', 'Bundesliga', 'Germany', 32, 980.00),
    ('Borussia Dortmund', 'Bundesliga', 'Germany', 8, 600.00),
    ('RB Leipzig', 'Bundesliga', 'Germany', 0, 500.00),
    ('Bayer Leverkusen', 'Bundesliga', 'Germany', 0, 400.00),

    ('Juventus', 'Serie A', 'Italy', 36, 700.00),
    ('AC Milan', 'Serie A', 'Italy', 19, 500.00),
    ('Inter Milan', 'Serie A', 'Italy', 19, 600.00),
    ('Napoli', 'Serie A', 'Italy', 3, 450.00),

    ('Paris Saint-Germain (PSG)', 'Ligue 1', 'France', 10, 1000.00),
    ('Olympique Lyonnais', 'Ligue 1', 'France', 7, 300.00),
    ('Olympique de Marseille', 'Ligue 1', 'France', 9, 250.00),
    ('AS Monaco', 'Ligue 1', 'France', 8, 320.00),

    ('Benfica', 'Primeira Liga', 'Portugal', 38, 300.00),
    ('Porto', 'Primeira Liga', 'Portugal', 30, 250.00),
    ('Sporting CP', 'Primeira Liga', 'Portugal', 19, 200.00),
    ('Braga', 'Primeira Liga', 'Portugal', 0, 100.00),

    ('Ajax', 'Eredivisie', 'Netherlands', 36, 400.00),
    ('PSV Eindhoven', 'Eredivisie', 'Netherlands', 24, 220.00),
    ('Feyenoord', 'Eredivisie', 'Netherlands', 15, 170.00),
    ('AZ Alkmaar', 'Eredivisie', 'Netherlands', 2, 100.00),

    ('Club Brugge', 'Belgian Pro League', 'Belgium', 18, 150.00),
    ('Anderlecht', 'Belgian Pro League', 'Belgium', 34, 120.00),
    ('Genk', 'Belgian Pro League', 'Belgium', 4, 100.00),
    ('Gent', 'Belgian Pro League', 'Belgium', 1, 90.00),

    ('Zenit St. Petersburg', 'Russian Premier League', 'Russia', 9, 230.00),
    ('CSKA Moscow', 'Russian Premier League', 'Russia', 7, 120.00),
    ('Spartak Moscow', 'Russian Premier League', 'Russia', 10, 100.00),
    ('Lokomotiv Moscow', 'Russian Premier League', 'Russia', 3, 80.00),

    ('Galatasaray', 'Turkish Süper Lig', 'Turkey', 23, 220.00),
    ('Fenerbahçe', 'Turkish Süper Lig', 'Turkey', 19, 200.00),
    ('Beşiktaş', 'Turkish Süper Lig', 'Turkey', 16, 180.00),
    ('Trabzonspor', 'Turkish Süper Lig', 'Turkey', 7, 150.00);
*/


-- Tüm Verileri Çekme
select * from top_clubs;

-- Sadece İstenen Sütunları Çekme
select club_name,country from top_clubs;

-- Koşula Göre Veri Çekme
select * from top_clubs where championships > 15;

-- Verileri Sıralama | Order By 
select * from top_clubs order by budget_million_eur desc;

-- Verileri Gruplandırma | Group By
select country, count(*) as Ulke_Takımları from top_clubs group by country;

-- Tabloda Kaç Veri Olduğunu Gösteren Sorgu
select count(*) from top_clubs;

-- Ortlama Hesaplama
select avg(budget_million_eur) as avg_budget from top_clubs;

-- En Yükse Değeri Getirme
select max(championships) as Total_Max_Championship from top_clubs;

-- En Küçük Değeri Getirme
select min(budget_million_eur) as En_Az_Bütce_Degeri_M_EURO From top_clubs;

-- Toplam Değeri Yazdırma
select sum(championships) as Toplam_Şampiyonluk from top_clubs;

-- Veri Güncelleme 
-- update top_clubs set championships = 1 where club_name = 'Bayern Leverkusen';

-- Veri Silme | 200M EURODAN Küçük Bütçesi  Olan Takımları Tablodan Silen Sorgu
-- DELETE FROM top_clubs WHERE budget_million_eur < 200;

-- WHERE Komutu ile Sadece İspanya Takımlarının İsin ve Bütçe Verilerini Çekme
select club_name, budget_million_eur from top_clubs where country = 'Spain';

-- Her Ligde ki En Yüksek Bütçeye Sahip Takımı Getiren Sorgu
select league_name, club_name, budget_million_eur from top_clubs
where (league_name, budget_million_eur) in
(select league_name, MAX(budget_million_eur) from top_clubs group by league_name);

-- Her Ligde ki Bütçesi 600M dan fazla olan takımları getiren sorgu
select club_name , budget_million_eur  from top_clubs where budget_million_eur > 600 ;

-- Her Ligdeki Şampiyonluğu 5 den Fazla Olan Takımaları Getiren Sorgu
SELECT club_name, championships FROM top_clubs WHERE championships > 5;

-- Her Ligde ki En Yüksek Bütçeye Sahip Takımı Getiren Sorgu
select league_name, club_name, budget_million_eur from top_clubs
where (league_name, budget_million_eur) in
(select league_name, MIN(budget_million_eur) from top_clubs group by league_name);

-- Belirli Bir Takımın Verisini Çekme
select * from top_clubs where club_name = 'Galatasaray';

-- Bütçesi 300 ve 600 Milyon Arasında Olan Takımlar
select club_name, budget_million_eur from top_clubs where budget_million_eur between 300 and 600;

-- Sütun Ekleme Sorgusu
-- ALTER TABLE top_clubs ADD COLUMN founded_year INT;

-- Sütun Adını Değiştirme
-- ALTER TABLE top_clubs CHANGE COLUMN budget_million_eur budget_million_euro DECIMAL(10, 2);

-- Sütun Silme 
-- ALTER TABLE top_clubs DROP COLUMN founded_year;
