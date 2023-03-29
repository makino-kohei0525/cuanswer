-- 問1 
-- 全選手の以下のデータを抽出してください。
-- ・背番号（uniform_num）
-- ・名前（name）
-- ・所属クラブ（club）
SELECT uniform_num, name, club
FROM players
-- このようなSQLを射影と呼びます。
-- この言葉が開発現場で使われることは稀ですが、
-- SEの登竜門ともいえる資格「基本情報技術者試験」では問われることもあります。


-- 問2
-- グループCに所属する国をすべて抽出してください。
SELECT * 
FROM countries
WHERE group_name = 'C'
-- このようにWHERE句で抽出するデータにフィルタをかけることを「選択」といいます。
-- こちらも「射影」と同じように基本情報技術者試験で問われることもありますので、押さえておきたいところです。
-- また、すべてのデータを抽出する場合にはSELECT句に「*」を使用することができます。
-- すべてのカラムを指定「SELECT id, name, ranking,group_name」と指定しても同じです。
-- WHERE句で条件を指定するわけですが、group_nameカラムはvarchar（文字列）ですので、
-- 指定するリテラルはシングルクォートでくくる必要があります。ダブルクォートやバッククォートではNGですので注意しましょう。


-- 問3
-- グループC以外に所属する国をすべて抽出してください。
SELECT * 
FROM countries
WHERE group_name <> 'C'
-- 「選択」を行うSQLの別バリエーションです。～以外を条件としたい場合には「<>」もしくは「!=」を使用します。
-- SELECT句の「*」やWHERE句の文字列リテラルに関しては前問と同じになりますので、同様に注意しておきましょう。


-- 問4
-- 現時点で40歳以上の選手を抽出してください。（誕生日の人を含めてください。）
-- 検索タイミングによって実行結果が異なります。
SELECT * 
FROM players
WHERE birth <= '1980-10-1'
-- 「選択」を行うSQLの別バリエーションです。40歳以上ということは、誕生日が「1976年1月13日」以前ということになります。
-- さらに誕生日の人を含めるということからこの日を入れて抽出しなくてはいけません。
-- WHERE句の条件式に「=」を忘れると抽出される選手が1名だけになるはずです。意外間違えやすいのが、不等号とイコールの順番です。
-- 不等号が先でイコールが後が正解で、逆にしてしまうとエラーとなりますので注意しましょう。
-- また、birthカラムはdate型（日付型）となっていますので、リテラルを条件に設定する場合には文字列のときと同様にシングルクォートで括る必要があります。
-- 文字列の時と同じくダブルクォートやバッククォートではNGとなりますので注意しましょう。
-- 日付の区切りに関してはハイフンを使用するのが一般的ですが、スラッシュを用いても問題ありません。


-- 問5
-- 身長が170cm未満の選手を抽出してください。
SELECT * 
FROM players
WHERE height < 170
-- 「選択」を行うSQLの別バリエーションです。170未満ということ170を抽出結果に含めてはいけませんので、イコールを付けずにWHERE句に「height < 170」と指定します。
--リテラルである「170」の前後にはシングルクォートを付けてもどちらでも構いません。
-- 抽出件数は28行になりますが、イコールを付けていた場合には46行となるはずです。


-- 問6
-- FIFAランクが日本（46位）の前後10位に該当する国（36位～56位）を抽出してください。ただし、BETWEEN句を用いてください。
SELECT * 
FROM countries
WHERE ranking BETWEEN 36 AND 56
-- 「選択」を行うSQLの別バリエーションです。FIFAランクが36位～56位の国を抽出するため、WHERE句に「ranking BETWEEN 36 AND 56」と指定します。
-- 注意しなくてはいけないのは、指定したリテラル36および56も含む（イコールを指定したときと同じ）抽出となることです。
-- 前問のように抽出結果にイコールを含めたくない場合には、BETWEEN句を使用することはできません。


-- 問7
-- 選手のポジションがGK、DF、MFに該当する選手をすべて抽出してください。ただし、IN句を用いてください。
SELECT * 
FROM players
WHERE position IN ('GK', 'DF', 'MF')
-- 「選択」を行うSQLの別バリエーションです。ポジションがGK、DF、MFの選手を抽出するため、WHERE句に「position IN (‘GK’, ‘DF’, ‘MF’)」と指定します。
-- IN句を用いずにOR句を用いて表現することも可能ですが、IN句を用いることでSQLがシンプルで読みやすいものになります。
-- 使えるときには積極的に使っていきたい構文と言えます。


-- 問8
-- オウンゴールとなったゴールを抽出してください。goalsテーブルのplayer_idカラムにNULLが格納されているデータがオウンゴールを表しています。
SELECT * 
FROM goals
WHERE player_id IS NULL
-- 「選択」を行うSQLの別バリエーションです。NULLが格納されているデータを条件として抽出したい場合には「player_id IS NULL」というように「IS NULL」を使用します。
-- くれぐれも「= NULL」としないようにしましょう。実際に「= NULl」とした場合を試していただければわかりますが、
-- SQLエラーになるわけではなく抽出件数がゼロ（すなわち該当データなし）となります。
-- 複雑な抽出条件を設定している場合など、机上だけでSQLを作成していると間違いに気づきにくいため注意が必要です。


-- 問9
-- オウンゴール以外のゴールを抽出してください。goalsテーブルのplayer_idカラムにNULLが格納されているデータがオウンゴールを表しています。
SELECT * 
FROM goals
WHERE player_id IS NOT NULL
-- 「選択」を行うSQLの別バリエーションです。NULL以外のデータを抽出したい場合には、「player_id IS NOT NULL」というように「IS NOT NULL」を使用します。
-- 「player_id <> NULL」としてしまうと正しく抽出することができません。（抽出件数がゼロ件になります。）
-- 前問と同じようにSQLエラーにはならず、間違えに気づきにくいことにも注意が必要です。


-- 問10
-- 名前の末尾が「ニョ」で終わるプレイヤーを抽出してください。
SELECT *
FROM players
WHERE name LIKE '%ニョ'
-- 「選択」を行うSQLの別のバリエーションです。「=」を使った条件設定では完全一致するデータしか抽出することができませんが、
-- 「LIKE」演算子を使用すると部分一致のあいまい検索をすることができます。LIKE演算子では、「%」を一緒に使用します。
-- 今回のように末尾が「ニョ」で終わる文字列を検索する（後方一致検索）場合には、%記号は前に付けます。逆に前方一致検索を行う場合には、%記号は後ろに付けます。


-- 問11
-- 名前の中に「ニョ」が含まれるプレイヤーを抽出してください。
SELECT *
FROM players
WHERE name LIKE '%ニョ%'
-- 「選択」を行うSQLの別のバリエーションです。「=」を使った条件設定では完全一致するデータしか抽出することができませんが、
-- 「LIKE」演算子を使用すると部分一致のあいまい検索をすることができます。LIKE演算子では、「%」を一緒に使用します。
-- 今回のようにname列の値のどこかに「ニョ」が含まれているというような前方後方一致検索の場合には、
-- 「ニョ」の前後両方に%記号を付けます。%記号は「’」（シングルクォート）の中に記述します。
-- このLIKE演算子を使った前方後方一致検索機能は、システム開発時にも非常によく使われる構文となりますので、確実に押さえておきましょう。


-- 問12
-- 全選手の中から小柄な選手（身長が165cm未満か、体重が60kg未満）を抽出してください。
SELECT *
FROM players
WHERE height < 165 OR weight < 60
-- 身長か体重のどちらかの条件を満たせばよい問題ですので、OR演算子を使用します。
-- 6件抽出されれば正解です。
-- 誤ってAND演算子を使用してしまうと抽出件数が2件となります。
-- たとえば、ベルナルジ選手は身長163cm、体重60kgです。
-- 身長は165cm以下という条件を満たしていますが、体重は60kg未満という条件を満たしていません。
-- OR演算子を使用することでこのようにどちらかの条件を満たしている選手を抽出できることになります。


-- 問13
-- FWかMFの中で170未満の選手を抽出してください。ただし、ORとANDを使用してください。
SELECT *
FROM players
WHERE (position = 'FW' OR position = 'MF') AND height < 170
-- 前問と同じくAND演算子とOR演算子を組み合わせて使うケースです。
-- AND演算子とOR演算子を組み合わせて使うケースでは条件の優先順位を明確する必要がでてくる場合があります。
-- SELECT *
-- FROM players
-- WHERE position = 'FW' OR position = 'MF' AND height < 170
-- 括弧を付けていないこのようなSQLでは、フッキ選手やフレジ選手のように身長180cm以上のFW選手が抽出されてしまいます。
-- これは、SQLでは「AND演算子の方がOR演算子より先に評価される」というルールがあるためです。
-- つまり、上記のSQLは、「FWの選手、もしくはMFで170cm未満の選手」を抽出していることになります。
-- AND演算子とOR演算が1つのSQLの中にどちらも登場するケースでは必ず括弧を付けるようにするとこのような間違いを起こしにくいためオススメです。


-- 問14
-- ポジションの一覧を重複なしで表示してください。グループ化は使用しないでください。
SELECT DISTINCT position FROM players;
-- テーブルの中のデータを一覧表示する際に、重複するデータを表示しないようにするためにはDISTINCT句を使用する方法とグループ化を使用する方法の2種類があります。
-- この問題ではグループ化は使用しないようにという指示があるため、DISTINCT句を使用する必要があります。
-- DISTINCT句はSELECT句の直後に記述するところに注意してください。


-- 問15
-- 全選手の身長と体重を足した値をカラム名「体力指数」として表示してください。合わせて選手の名前、選手の所属クラブも表示してください。
SELECT name, club, height + weight AS 体力指数 FROM players;
-- 問題17とほぼ同じ問題ですが、表示する際に1つ条件が設定されています。
-- このようにSELECT句に記述したカラム名や計算式を変更したい場合（表示するカラム名を変更する場合）にはAS句を使用します。


-- 問16
-- 全ての選手を身長の大きい順に表示してください。同じ身長の選手は体重の重い順に表示してください。
SELECT *
FROM players
ORDER BY height DESC, weight DESC
-- 複数カラムでソートを行う問題です。まず、身長の大きい順ということですので、「ORDER BY」句で「height DESC」を指定すればよいことになります。
-- 同じ身長の場合は体重の重い順、すなわち第2ソートに身長を指定すればよいことになります。「ORDER BY」句の続きにカンマで区切って「weight DESC」を指定します。
-- 第1ソートの身長も、第2ソートの体重もどちらも降順になるので、DESCをつけ忘れないようにしましょう。


-- 問17
-- 全てのゴール情報を出力してください。ただし、オウンゴール（player_idがNULLのデータ）はCASE関数を使用してplayer_idを「9999」と表示してください。
SELECT
    CASE WHEN player_id IS NULL THEN 9999 ELSE player_id END AS player_id, 
    goal_time
FROM goals
-- SQL文を作成するにあたってNULLの含まれるデータは様々な問題を引き起こします。
-- そこで、今回の問題のようにNULLを他のデータへ置き換えるという手法を取る場合があります。
-- MySQLではこのような用途で使用できる単一行関数は「CASE」「IF」「IFNULL」があります。
-- この問題で使用するCASE関数の場合は、前問のIFNULL関数よりもより汎用的に表示データの条件付けや加工を行うことができます。
-- WHEN句で指定した条件のうちtrueである最初の条件の結果が返されます。
-- 一致する結果値がなかった場合は、ELSE のあとの結果が返され、ELSE 部分がない場合は、NULL が返されます。
-- 他のRDBMSでは関数名が異なる場合がありますので、注意してください。（Oracleでは「NVL」という関数になります。）


-- 問18
-- 全ての選手の平均身長、平均体重を表示してください。
SELECT AVG(height) AS 平均身長, AVG(weight) AS 平均体重
FROM players
-- 平均値を求めるグループ関数AVGを使用する問題です。グループ関数を使用すると指定したグループ単位にデータをまとめて表示することが可能です。
-- playersテーブルには736行のデータが存在しますが、実行結果を見ると1行になっています。
-- 今回は全736行を1つのグループとみなしてグループ関数を使用しているので、抽出される件数も1件ということになります。
-- グループを1つではなく、いくつかのグループに分けたい場合には、GROUP BY句を使用するのですがまた別の問題としたいと思います。
-- グループ化やグループ関数は、テーブル結合とならんでSQLの中で苦手意識をもちやすい難解な概念ですが、しっかりと使えるようになっておきたいところです。


-- 問19
-- 日本の選手（player_idが714から736）が上げたゴール数を表示してください。
SELECT COUNT(id) AS 日本のゴール数
FROM goals
WHERE 714 <= player_id AND player_id <= 736
-- 行数を求めるグループ関数COUNTを使用する問題です。グループ関数を使用すると指定したグループ単位にデータをまとめて表示することが可能です。
-- 今回は日本の選手が上げたゴール数ですので、goalsテーブルの中に2行のデータが存在します。
-- グループ関数を使用するとこの2行のデータを1つのグループとみなしてCOUNT関数を適用しています。
-- COUNT関数は非常によく使用する関数の中の1つですので、しっかりと使えるようになっておきたいところです。
-- COUNT関数の括弧の中には、アスタリスクもしくはカラム名を指定することができますが、
-- 一般的には回答例のようにアスタリスクとするかそのテーブルのPK（プライマリーキー）を指定するのが普通です。
-- 場合によっては、アスタリスクも使用を控えるようにと言われるケースもあります。
-- これは、アスタリスクに比べPKを指定する方がSQLの実行が早くなるためです。


-- 問20
-- 全ての選手の中で最も高い身長と、最も軽い体重を表示してください。
SELECT MAX(height) AS 最大身長, MIN(weight) AS 最大体重
FROM players
-- 最大値を求めるグループ関数MAXを使用する問題です。グループ関数を使用すると指定したグループ単位にデータをまとめて表示することが可能です。
-- playersテーブルには736行のデータが存在しますが、実行結果を見ると1行になっています。
-- 今回は全736行を1つのグループとみなしてグループ関数を使用しているので、抽出される件数も1件ということになります。
-- グループを1つではなく、いくつかのグループに分けたい場合には、GROUP BY句を使用するのですがまた別の問題としたいと思います。
-- グループ化やグループ関数は、テーブル結合とならんでSQLの中で苦手意識をもちやすい難解な概念ですが、しっかりと使えるようになっておきたいところです。


-- 問21
-- CグループのFIFAランクの合計値を表示してください。
SELECT SUM(ranking) AS CグループのFIFAランクの合計値
FROM countries
WHERE group_name = 'C'
-- 合計値を求めるグループ関数SUMを使用する問題です。
-- グループ関数を使用すると指定したグループ単位にデータをまとめて表示することが可能です。
-- countriesテーブルには32行のデータが存在しますが、実行結果を見ると1行になっています。
-- 今回は全32行を1つのグループとみなしてグループ関数を使用しているので、抽出される件数も1件ということになります。


-- 問22
-- 全ての試合の国名と選手名、得点時間を表示してください。オウンゴール（player_idがNULL）は表示しないでください。
SELECT c.name, p.name, g.goal_time
FROM goals g
JOIN players p ON g.player_id = p.id
JOIN countries c ON p.country_id = c.id
-- JOINを用いてテーブル複数の同士を内部結合を行う問題です。
-- JOIN ON をを繰り返すことで複数のテーブルを結合することが可能になります。
-- 基本的な使い方は、1対1のテーブル結合と同様なため、しっかりと基礎を抑えることが重要です。


-- 問23
-- 全ての試合のゴール時間と選手名を表示してください。左側外部結合を使用してオウンゴール（player_idがNULL）も表示してください。
SELECT g.goal_time, p.uniform_num, p.position, p.name
FROM goals g
LEFT JOIN players p ON g.player_id = p.id
-- JOIN句を用いてテーブルの外部結合を行う問題です。FROM句とJOIN句に記述するテーブルをどちらにするかは特に守らなくてはいけないルールがあるわけではありません。
-- 抽出されるデータの特性から結合する2つのテーブルをメインとなるテーブルとサブテーブルに分類して、メインテーブルをFROM句に記述、サブテーブルをJOIN句へ記述することが多いようです。
-- 今回の問題では、「全ての試合のゴール時間」すなわちgoalsテーブルのNULLデータも含めて抽出する必要があるため、
-- ゴール時間を管理しているgoalsテーブルをメインテーブルと考えた方がベターです。
-- また、必須ではないですが、テーブル結合を行う際はテーブルに別名を付けのが一般的ですので忘れずに行いましょう。


-- 問24
-- 全ての試合のゴール時間と選手名を表示してください。右側外部結合を使用してオウンゴール（player_idがNULL）も表示してください。
SELECT g.goal_time, p.uniform_num, p.position, p.name
FROM players p 
RIGHT JOIN goals g ON g.player_id = p.id
-- JOIN句を用いてテーブルの外部結合を行う問題です。FROM句とJOIN句に記述するテーブルをどちらにするかは特に守らなくてはいけないルールがあるわけではありません。
-- 抽出されるデータの特性から結合する2つのテーブルをメインとなるテーブルとサブテーブルに分類して、メインテーブルをFROM句に記述、サブテーブルをJOIN句へ記述することが多いようです。
-- 今回の問題では、「全ての試合のゴール時間」すなわちgoalsテーブルのNULLデータも含めて抽出する必要があるため、
-- ゴール時間を管理しているgoalsテーブルをメインテーブルと考えた方がベターです。そのため本来はgoalsテーブルをFROM句へ指定するべきですが、
-- 問題文で「右側外部結合」を使うという指示がありますので、playersテーブルがFROM句となります。
-- また、必須ではないですが、テーブル結合を行う際はテーブルに別名を付けのが一般的ですので忘れずに行いましょう。


-- 問25
-- 全ての試合のゴール時間と選手名、国名を表示してください。また、オウンゴール（player_idがNULL）も表示してください。
SELECT c.name AS country_name, g.goal_time, p.position, p.name AS player_name
FROM goals g
LEFT JOIN players p ON g.player_id = p.id
LEFT JOIN countries c ON p.country_id = c.id
-- 3つのテーブルを外部結合する問題です。オウンゴールの場合には、goalsテーブルのplayer_idがNULLとなっているため、
-- playerテーブルを結合するときもcountriesテーブルを結合するときも左側外部結合（LEFT JOIN）を使う必要があります。
-- 実際にシステム開発でSQLを作る場合にもこのように多数のテーブルが外部結合されているケースがほとんどです。
-- 複雑なSQLになるほどFROM句に「メインとなるテーブルを記述する」というルールを守っておくことが、後からSQLを修正するときや他の人のソースを修正するときに威力を発揮します。


-- 問26
-- 全てのゴール時間と得点を上げたプレイヤー名を表示してください。オウンゴールは表示しないでください。ただし、結合は使わずに副問合せを用いてください。
SELECT g.id, g.goal_time, (SELECT p.name FROM players p WHERE p.id = g.player_id) AS player_name
FROM goals g
WHERE g.player_id IS NOT NULL
-- SELECT句で副問合せを使用する問題です。副問合せはこのようなSELECT句だけでなくWHERE句やFROM句に記述することもできますが、
-- このようにSELECT句の中にSELECT句を記述する場合の副問合せでは、埋め込まれているSELECT文が返す行数は必ず1行にする必要があります。（単一行副問合せといいます。）
-- 複数行を返すようなSQLの場合にはエラーとなってしまいますので、注意しましょう。


-- 問27
-- 各ポジションごと（GK、FWなど）に最も身長と、その選手名、所属クラブを表示してください。ただし、FROM句に副問合せを使用してください。
SELECT p1.position, p1.最大身長, p2.name, p2.club
FROM 
(
  SELECT position, MAX(height) AS 最大身長
  FROM players
  GROUP BY position
) p1
LEFT JOIN players p2 ON p1.最大身長 = p2.height AND p1.position = p2.position
-- FROM句に副問合せを使用する代表的なケースといっていいかもしれません。
-- FROM句に記述したSELECT文があたかもテーブルのような扱いになります。
-- SQLを覚えたばかりの方がよくしてしまうのが以下のような間違いです。
-- SELECT position, MAX(height) AS 最大身長, name, club FROM players GROUP BY position
-- これは、「グループ化しているとき（GROUP BY句を記述しているとき）は、
-- SELECT句にはグループ関数を用いた列かGROUP BY句で指定した列しか記述できない」というルールに反してしまっています。（SELECT句にname、clubがあるのが誤りです。）
-- MySQLではこのような誤ったSQLもエラーにならず実行できてしまいますが、構文間違いとなりますので注意しましょう。


-- 問28
-- 各グループの最上位と最下位を表示し、その差が50より大きいグループを抽出してください。
SELECT group_name, MAX(ranking), MIN(ranking)
FROM countries
GROUP BY group_name
HAVING MAX(ranking) -  MIN(ranking) > 50
-- グループ関数（MAXやMIN）の結果をつかって抽出条件を作りたい場合は、WHERE句ではなくHAVING句に記述します。
-- WHERE句に記述するとエラーとなってしまいますので、注意してください。


-- 問29
-- 1980年生まれと、1981年生まれの選手が何人いるか調べてください。ただし、日付関数は使用せず、UNION句を使用してください。
SELECT '1980' AS 誕生年, COUNT(id)
FROM players
WHERE birth BETWEEN '1980-1-1' AND '1980-12-31'
UNION
SELECT '1981', COUNT(id)
FROM players
WHERE birth BETWEEN '1981-1-1' AND '1981-12-31'
-- 日付関数を使用すると同じことが可能かもしれませんが、今回はUNION句を使用してみました。
-- UNION句を使うと、2つのSELECTの結果を行方向（縦）につなげることができます。
-- 注意点としては、2つのSELECT句は同じ列数を返す必要があることです。それほど使用頻度の多いものではありません。


-- 問30
-- 身長が195㎝より大きいか、体重が95kgより大きい選手を抽出してください。
-- ただし、以下の画像のように、どちらの条件にも合致する場合には2件分のデータとして抽出してください。また、結果はidの昇順としてください。
SELECT id, position, name, height, weight
FROM players
WHERE height > 195
UNION ALL
SELECT id, position, name, height, weight
FROM players
WHERE weight > 95
ORDER BY id
-- たとえば、フォレスター選手が2件分抽出されています。
-- 「どちらの条件にも合致する場合には2件分のデータとして抽出」という指示があるため、WHERE句で条件を設定する方法ではうまく抽出することができません。
-- そこでUNION句を使用するのですが、前問のようにUNION ALL句ではなくUNION句を使用してしまうと、相変わらず2件として抽出することができません。
-- これは、UNION句では同じ行は自動的にマージ（2行が1行にまとまってしまう）されてしまうためです。
-- 同じ行があったとしてもマージせず2件分として抽出したい場合にはUNION ALL句を使います。
-- 注意事項としては、UNION句と同じように2つのSELECTの列数を同じにしておく必要があります。

-- 問31
-- 身長の高い選手6位～20位を抽出し、以下の項目を表示してください。
-- ※身長が同じ選手がいる場合、同じ身長の中でも名前の順番(昇順)に並び替えてください。
-- ・名前
-- ・身長
-- ・体重
SELECT name, height, weight
FROM players
ORDER BY height DESC, name ASC
LIMIT 15 OFFSET 5;
-- LIMITを用いるやや応用的なSQLです。
-- LIMIT句の使い方
-- LIMIT [offset,] row_count
-- LIMIT句はこのようにカンマ区切りで値を2つ指定すると、抽出するデータのスタート位置を指示することができます。
-- 正当例のように5を指定すると、6位（6行目）から表示となります。これはゼロから数えはじめ、ゼロが1行目を表すからです。
-- 2つ目の値は前問と同じように表示する行数を表し、今回は6位～20位の15選手を抽出する必要がありますので15となります。
-- このような開始行数を指定するLIMIT句は実際に業務システムを作る際に、一覧画面のページ遷移機能でよく使用されます。


-- 問32
-- グループCの各対戦毎にゴール数を表示してください。
-- ゴール数がゼロの場合も表示してください。副問合せは使わずに、外部結合だけを使用して下さい。
-- 表示するカラム
-- ・キックオフ日時
-- ・自国名
-- ・対戦相手国名
-- ・自国FIFAランク
-- ・対戦相手国FIFAランク
-- ・自国のゴール数
-- ソート順
-- ・キックオフ日時
-- ・自国FIFAランク
SELECT 
p1.kickoff, c1.name AS my_country, c2.name AS enemy_country,
c1.ranking AS my_ranking, c2.ranking AS enemy_ranking,
COUNT(g1.id) AS my_goals
FROM pairings p1
LEFT JOIN countries c1 ON c1.id = p1.my_country_id
LEFT JOIN countries c2 ON c2.id = p1.enemy_country_id
LEFT JOIN goals g1 ON p1.id = g1.pairing_id
WHERE c1.group_name = 'C' AND c2.group_name = 'C'
GROUP BY p1.kickoff, c1.name, c2.name, c1.ranking, c2.ranking
ORDER BY p1.kickoff, c1.ranking
-- 「ゴール数がゼロの場合も表示」ということですので、メインテーブルとなるのはpairingsテーブルとします。
-- 表示するカラムはこのpairingsテーブルとcountriesテーブルを結合（2つ）、goalsテーブルすれば全て表示することが可能です。
-- 間違いやすいポイントとしては、以下が挙げられます。
-- ・GROUP BY句にSELECT句で指定したカラムを全て列挙する
-- ・my_goalsはgoalsテーブルのPKをカウントする
-- ・決勝リーグの結果が含まれないように自国と対戦国がどちらもCグループという条件を付ける


-- 問33
-- グループCの各対戦毎にゴール数を表示してください。
-- ゴール数がゼロの場合も表示してください。自国のゴール数は副問合せを用いて表示してください。
-- 表示するカラム
-- ・キックオフ日時
-- ・自国名
-- ・対戦相手国名
-- ・自国FIFAランク
-- ・対戦相手国FIFAランク
-- ・自国のゴール数
-- ソート順
-- ・キックオフ日時
-- ・自国FIFAランク
SELECT 
p1.kickoff, c1.name AS my_country, c2.name AS enemy_country,
c1.ranking AS my_ranking, c2.ranking AS enemy_ranking,
(SELECT COUNT(g1.id) FROM goals g1 WHERE p1.id = g1.pairing_id) AS my_goals
FROM pairings p1
LEFT JOIN countries c1 ON c1.id = p1.my_country_id
LEFT JOIN countries c2 ON c2.id = p1.enemy_country_id
WHERE c1.group_name = 'C' AND c2.group_name = 'C'
ORDER BY p1.kickoff, c1.ranking
-- 問14と同じ問題ですが、今回は副問合せを用います。
-- 回答例のように副問合せを使うとグループ化（GROUP BY句）を使用する必要がなくなりSQLがすっきりした印象となります。
-- 間違いやすいポイントも前問では3つありましたが、1つだけになります。
-- ・決勝リーグの結果が含まれないように自国と対戦国がどちらもCグループという条件を付ける
