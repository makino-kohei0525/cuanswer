﻿<?php
// 配列に日本,アメリカ,イギリス,フランスを
// 格納し、foreach文を使って順番に
// 「要素番号:国名」を出力してください。
//0:日本
//1:アメリカ
//2:イギリス
//3:フランス
//と表示されていればOKです！

$countries = ['日本', 'アメリカ', 'イギリス', 'フランス'];

foreach ($countries as $key => $country) {
    echo $key . '：' . $country . '<br>';
}

// ポイント：連想配列ではなく通常の配列になっているか
// ポイント：foreach文を用いて foreach (配列 as キー => 値)になっているか
// ポイント：キー：値で縦に出力できているか
