<?php
//各変数に値を指定のデータ型で代入し、画面にデータ型を出力させることで確認してください。

//Q1.値：Hello world.　データ型：string
$string = "Hello world.";
echo gettype($string) . '<br>';
//Q2.値：10　データ型：integer
$integer = 10;
echo gettype($integer) . '<br>';
//Q3.値：2.5　データ型：float(double)
$float = 2.5;
echo gettype($float) . '<br>';
//Q4.値：false　データ型：boolean
$boolean = false;
echo gettype($boolean) . '<br>';
//Q5.値：null　データ型：null
$null = NULL;
echo gettype($null) . '<br>';

// ポイント：getTypeやvar_dump等でデータ型が表示すするようにしているか
// Q1ポイント：ダブルクォーテーション（""）やシングルクォーテーション（''）等で囲んで文字列にして「Hello world.」を代入しているか
// Q2ポイント：ダブルクォーテーション（""）やシングルクォーテーション（''）等で囲まずに数字にして「10」を代入しているか
// Q3ポイント：ダブルクォーテーション（""）やシングルクォーテーション（''）等で囲まずに数字にして「2.5」を代入しているか
// Q4ポイント：ダブルクォーテーション（""）やシングルクォーテーション（''）等で囲まずにbooleanにして「false」を代入しているか
// Q5ポイント：ダブルクォーテーション（""）やシングルクォーテーション（''）等で囲まずにNULLにして「NULL」を代入しているか
