<?php
// 以下をそれぞれ表示してください。
// 表示するタイミングによって自動で算出すること
// ・現在日時（yyyy年mm月dd日 H時i分s秒）
// ・現在日時から3日後
// ・現在日時から12時間前
// ・2020年元旦から現在までの経過日数
// ・現在の西暦を和暦に変更して出力

// 日時がおかしい場合、PHPのタイムゾーン設定を行ってください

echo date('Y年m月d日 H時i分s秒') . '<br>';

// ポイント：YYYY年mm月dd日 H時i分s秒形式で表示されている

echo date('Y年m月d日 H時i分s秒', strtotime('+3 day')) . '<br>';

// ポイント：日付が3日後で表示されている

echo date('Y年m月d日 H時i分s秒', strtotime('-12 hour')) . '<br>';

// ポイント：日付が12時間前で表示されている

$now = new DateTime();
$targetDate = new DateTime('2020-01-01');

$dateDiff = $targetDate->diff($now);
echo $dateDiff->format('%a日') . '<br>';

// ポイント：総日数が表示されている(日付比較サイト等で調べてあっていたらOK)

$eras = [
    ['year' => '2018', 'name' => '令和'],
    ['year' => '1989', 'name' => '平成'],
    ['year' => '1926', 'name' => '昭和'],
    ['year' => '1912', 'name' => '大正'],
    ['year' => '1873', 'name' => '明治'],
];

foreach ($eras as $era) {
    $year = $era['year'];
    $name = $era['name'];

    if (date('Y') > $year) {
        $eraYear = date('Y') - $year;

        if ($eraYear === 1) {
            echo $name . '元年';
            break;
        }

        echo $name . $eraYear . '年';
        break;
    }
}

// ポイント：和暦があっているか
