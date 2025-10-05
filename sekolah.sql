
CREATE DATABASE sekolah;
USE sekolah;


CREATE TABLE siswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    umur INT,
    jurusan VARCHAR(50)
);

CREATE TABLE nilai (
    id INT AUTO_INCREMENT PRIMARY KEY,
    siswa_id INT,
    mata_pelajaran VARCHAR(100),
    nilai INT,
    FOREIGN KEY (siswa_id) REFERENCES siswa(id)
);


INSERT INTO siswa (nama, umur, jurusan)
VALUES
("Andi", 16, "IPA"),
("Budi", 17, "IPS"),
("Citra", 16, "IPA"),
("Dewi", 17, "Bahasa"),
("Eko", 16, "IPS");

INSERT INTO nilai (siswa_id, mata_pelajaran, nilai)
VALUES
(1, "Matematika", 85),
(1, "Fisika", 90),
(2, "Ekonomi", 88),
(2, "Bahasa Inggris", 90),
(3, "Biologi", 92),
(3, "Kimia", 80),
(4, "Bahasa Indonesia", 89),
(4, "Sastra", 95),
(5, "Sosiologi", 78),
(5, "Geografi", 82);


SELECT * FROM siswa;


SELECT nama FROM siswa WHERE jurusan = 'IPA';


SELECT siswa.nama, AVG(nilai.nilai) AS rata_nilai
FROM siswa
JOIN nilai ON siswa.id = nilai.siswa_id
GROUP BY siswa.nama;

UPDATE siswa
SET jurusan = 'Bahasa'
WHERE nama = 'Eko';

DELETE FROM nilai
WHERE siswa_id = 1 AND mata_pelajaran = 'Fisika';

INSERT INTO siswa (nama, umur, jurusan) VALUES ("Farhan", 18, "IPA");
INSERT INTO nilai (siswa_id, mata_pelajaran, nilai) VALUES (6, "Biologi", 89);
