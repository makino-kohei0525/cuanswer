<?php
// ＜アルゴリズムの注意点＞
// アルゴリズムではこれまでのように調べる力ではなく物事を論理的に考える力が必要です。
// 検索して答えを探して解いても考える力には繋がりません。
// まずは検索に頼らずに自分で処理手順を考えてみましょう。

//また、【その処理が必要かどうか・適切かを考えるため、コメントアウトで一行毎に処理の内容を記述してください。】


// 問.以下は自動販売機のお釣りを計算するプログラムです。
// 150円のお茶を購入した際のお釣りを計算して表示してください。
// 計算内容は関数に記述し、関数を呼び出して結果表示すること
// $yen と $product の金額を変更して計算が合っているか検証を行うこと

// 表示例1）
// 10000円札で購入した場合、
// 10000円札x0枚、5000円札x1枚、1000円札x4枚、500円玉x1枚、100円玉x3枚、50円玉x1枚、10円玉x0枚、5円玉x0枚、1円玉x0枚

// 表示例2）
// 100円で購入した場合、
// 50円足りません。

$yen = 183;   // 購入金額
$product = 155; // 商品金額

$change = $yen - $product;

function calc($yen, $product)
{
    // この関数内に処理を記述

    // 商品金額が購入金額より大きい場合
    if ($product > $yen) {
        return [];
    }
    // 金額単位一覧
    $money = [10000, 5000, 1000, 500, 100, 50, 10, 5, 1];

    // おつり
    $change = $yen - $product;

    $result = [];
    foreach ($money as $value) {
        // それぞれの金額の枚数を取得
        $moneyCount = floor($change / $value);
        // [金額 => 枚数]の連想配列に格納
        $result[$value] = $moneyCount;

        // 枚数が0枚より多い場合
        if ($moneyCount > 0) {
            // おつりから金額×枚数の結果を引く
            $change -= $value * $moneyCount;
        }
    }
    // 結果を返す
    return $result;
}

// ポイント：引数「$yen」「$product」を用いて処理しているか

$result = calc($yen, $product);

// ポイント：23・24行目の「$yen」「$product」を引数に用いているか

// 結果が空の場合
if (empty($result)) {
    // 不足分を取得
    $shortage = $product - $yen;
    // 表示するテキスト
    $text = "{$shortage}円足りません。";
} else {
    foreach ($result as $money => $moneyCount) {
        // 金額の単位を1000以上の場合は「円札」それ以外は「円玉」に変換
        $displayYen = $money >= 1000 ? "{$money}円札" : "{$money}円玉";
        // 一旦配列にテキストを格納
        $tmp[] = "{$displayYen}×{$moneyCount}枚";
    }
    // 表示するテキストに「,」をつける
    $text = implode(',', $tmp);
}
?>
<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="utf-8">
    <title>お釣り</title>
</head>

<body>
    <section>
        <!-- ここに結果表示 -->
        <p><?= $yen ?>円で購入した場合、</p>
        <p><?= $text ?></p>
        <!-- ポイント：枚数が正しいか確認する -->
        <!-- ポイント：金額が不足しているときに「〇円足りません。」とでているか -->
    </section>
</body>

</html>
