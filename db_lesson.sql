Q1.
mysql> CREATE TABLE departments (
    -> department_id INT unsigned auto_increment PRIMARY KEY, 
    ->  name VARCHAR(20) NOT NULL,
    -> created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -> updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -> );

Q2.
ALTER TABLE people ADD department_id INT unsigned;--emailの後ろに追加する

Q3. 
INSERT INTO departments (name) VALUES ('営業'),('開発'),('経理'),('人事'),('情報システム');

INSERT INTO people (name,department_id)
    -> VALUES
    -> ('山田花子',2),
    -> ('佐藤健',2),
    -> ('鈴木誠',2),
    -> ('高橋優',3),
    -> ('伊藤美咲',4),
    -> ('中村直樹',5);


mysql> INSERT INTO reports (person_id ,content)
    -> VALUES
    -> (1,'営業先へ訪問しサービスの提案を行いました'),
    -> (2,'新規顧客への電話営業と資料作成をしました'),
    -> (3,'既存顧客へのフォロー連絡と打ち合わせをしました'),
    -> (5,'新機能の仕様確認と設計作業を進めました'),
    -> (16,'開発中のシステムのバグ修正を行いました'),
    -> (17,'APIの実装とテストを行い動作確認しました'),
    -> (18,'画面デザインの調整とコード修正をしました'),
    -> (19,'経費精算の確認と帳簿の整理を行いました'),
    -> (20,'採用応募者の書類確認と面接準備をしました'),
    -> (21,'社内ネットワークの設定と動作確認をしました');


Q4.
mysql> UPDATE people
    -> SET email = 'toyoshima@gizumo.jp'
    -> WHERE person_id = 3;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET email = 'hushigi@gizumo.jp'  WHERE person_id = 5;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET email = 'yamada@gizumo.jp'  WHERE person_id = 16;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET email = 'sato@gizumo.jp'  WHERE person_id = 17;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET email = 'suzuki@gizumo.jp'  WHERE person_id = 18;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET email = 'takahashi@gizumo.jp'  WHERE person_id = 19;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET email = 'ito@gizumo.jp'  WHERE person_id = 20;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET email = 'nakamura@gizumo.jp'  WHERE person_id = 21;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people
    -> SET age =35,gender =2
    -> WHERE person_id =5;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET age =25,gender =2 WHERE person_id =16;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET age =25,gender =2 WHERE person_id =16;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 1  Changed: 0  Warnings: 0


mysql> UPDATE people SET age =28,gender =1 WHERE person_id =17;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET age =36,gender =1 WHERE person_id =18;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET age =30,gender =2 WHERE person_id =19;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET age =23,gender =2 WHERE person_id =20;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET age =40,gender =1 WHERE person_id =21;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

Q5.
mysql> SELECT * FROM people
    -> WHERE gender = 1
    -> ORDER BY age DESC, name;

Q6.
Peopleテーブルから
department_idレコードが1で部署が営業の人の
Name,email,ageカラムを作成日が古い順で表示する。

Q7.
mysql> SELECT name FROM people WHERE age BETWEEN 20 AND 29 AND gender = 2 OR age BETWEEN 40 AND 49 AND gender = 1;

Q8.
mysql> SELECT * FROM people WHERE department_id = 1
    -> ORDER BY age ASC;

Q9.
mysql> SELECT AVG(age) FROM people WHERE department_id = 2 AND gender = 2;

Q10.
mysql> SELECT people.name,departments.name,reports.content FROM people INNER JOIN reports ON people.person_id=reports.person_id INNER JOIN departments ON people.department_id  = departments.department_id;

Q11.
mysql> SELECT people.name FROM people LEFT JOIN reports ON people.person_id = reports.person_id WHERE reports.person_id IS NULL;

