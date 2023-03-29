<?php

// 以下の整理されていない配列$inを$outのように整形して出力してください

$in = [
    ['2nd' => 'two'],
    ['four' => '4th'],
    ['three' => '3rd'],
    ['one' => '1st'],
    ['10th' => 'ten'],
    ['6th' => 'six'],
    ['5th' => 'five'],
    ['seven' => '7th'],
    ['fourteen' => '14th'],
    ['11th' => 'eleven'],
    ['8th' => 'eight'],
    ['thirteen' => '13th'],
    ['12th' => 'twelve'],
    ['nine' => '9th'],
    ['15th' => 'fifteen'],
];

// $out = [
//     '1st' => 'one',
//     '2nd' => 'two',
//     '3rd' => 'three',
//     '4th' => 'four',
//     '5th' => 'five',
//     '6th' => 'six',
//     '7th' => 'seven',
//     '8th' => 'eight',
//     '9th' => 'nine',
//     '10th' => 'ten',
//     '11th' => 'eleven',
//     '12th' => 'twelve',
//     '13th' => 'thirteen',
//     '14th' => 'fourteen',
//     '15th' => 'fifteen',
// ];

$left = [];
$right = [];
foreach ($in as $array) {
    foreach ($array as $key => $value) {
        // 文字がすべてアルファベット以外の時
        if (!ctype_alpha($key)) {
            // $leftに$keyを代入
            $left[] = $key;
        } else {
            // それ以外の場合に$rightに$keyを代入
            $right[] = $key;
        }

        // 文字がすべてアルファベット以外の時
        if (!ctype_alpha($value)) {
            // $leftに$valueを代入
            $left[] = $value;
        } else {
            // それ以外の場合に$rightに$valueを代入
            $right[] = $value;
        }
    }
}

$out = [];
foreach ($left as $key => $value) {
    // $outを[$leftの値 => $rightの値]の連想配列にする
    $out[$value] = $right[$key];
}

// ソート
ksort($out, SORT_NUMERIC);

// ポイント：ksort()だけでソートするとおかしくなるので、「SORT_NUMERIC」「SORT_NATURAL」のどちらかをつける
// ポイント：下記のような配列になっているか
//  [
//     '1st' => 'one',
//     '2nd' => 'two',
//     '3rd' => 'three',
//     '4th' => 'four',
//     '5th' => 'five',
//     '6th' => 'six',
//     '7th' => 'seven',
//     '8th' => 'eight',
//     '9th' => 'nine',
//     '10th' => 'ten',
//     '11th' => 'eleven',
//     '12th' => 'twelve',
//     '13th' => 'thirteen',
//     '14th' => 'fourteen',
//     '15th' => 'fifteen',
// ];
?>
<pre>
    <?php print_r($out) ?>
</pre>
