<?php
//以下データを多次元配列として一つの配列にしてください。
//会社名：A社　所在地：東京　電話番号：000-0000-0000
//会社名：B社　所在地：大阪　電話番号：111-1111-1111
//会社名：C社　所在地：福岡　電話番号：222-2222-2222
//※キーは英名で設定すること

//また、C社の所在地を出力してください。

$companies = [
    ['name' => 'A社', 'location' => '東京', 'tel' => '000-0000-0000'],
    ['name' => 'B社', 'location' => '大阪', 'tel' => '111-1111-1111'],
    ['name' => 'C社', 'location' => '福岡', 'tel' => '222-2222-2222'],
];

echo $companies[2]['location'];

// ポイント：多次元配列になっているか（多次元配列：配列の中に配列）
//              →今回の場合は配列の中に連想配列が正解
// ポイント：キー名がそれぞれ同じかどうか
// ポイント：出力の際に配列[要素番号][キー名]になっているか（他に処理があった場合は柔軟な対応）
