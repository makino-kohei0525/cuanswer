<?php
// 連想配列の要素name, age, genderに
// 田中,25,男
// という値を格納し、

// 田中
// 25歳・男性

// という形で出力してください。

$person = [
    'name' => '田中',
    'age' => 25,
    'gender' => '男',
];

echo $person['name'] . '<br>' . $person['age'] . '歳・' . $person['gender'] . '性';

// ポイント：連想配列になっていて、キーがそれぞれ name, age, gender になっているか
// ポイント：配列名[キー名]として出力しているか

