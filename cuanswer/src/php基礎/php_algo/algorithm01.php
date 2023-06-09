<?php
// ＜アルゴリズムの注意点＞
// アルゴリズムではこれまでのように調べる力ではなく物事を論理的に考える力が必要です。
// 検索して答えを探して解いても考える力には繋がりません。
// まずは検索に頼らずに自分で処理手順を考えてみましょう。

//また、【その処理が必要かどうか・適切かを考えるため、コメントアウトで一行毎に処理の内容を記述してください。】

// 問.配列に10,60,90,70,50を点数として格納し
// それぞれをif文で

// 80点以上なら「優」
// 60点以上なら「良」
// 40点以上なら「可」
// それ以下なら「不可」

// という形で区別し、
// 【 ○○点は「○」】です。と出力してください。

//表示が以下の通りになり、配列の中身を変更したり要素数を増減させた時、その変化によって表示が変わるよう記述してください。
// 10点は「不可」です。
// 60点は「良」です。
// 90点は「優」です。
// 70点は「良」です。
// 50点は「可」です。

$scores = [10, 60, 90, 70, 50];

// ポイント：通常の配列で値を格納している

foreach ($scores as $score) {
    if ($score >= 80) {
        $judge = '優';
    } elseif ($score >= 60) {
        $judge = '良';
    } elseif ($score >= 40) {
        $judge = '可';
    } else {
        $judge = '不可';
    }

    echo "{$score}点は「{$judge}」です。<br>";
}

// ポイント：ループ文（配列なのでforeach文がベター）でそれぞれの値に対して処理をしている
// ポイント：if (「それぞれの値」 >= 80)から始めていること(比較する値を大きい順からにしないと途中で引っかかって表示がおかしくなってしまう)
// ポイント：「それぞれの値」点は・・・です。で表示されていること
// ※「それぞれの値」というのは foreach (配列 as 値) で作成したそれぞれの「値」のこと(今回でいうと$scoreにあたる)
