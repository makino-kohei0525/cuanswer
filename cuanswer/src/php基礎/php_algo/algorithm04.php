<?php
// ＜アルゴリズムの注意点＞
// アルゴリズムではこれまでのように調べる力ではなく物事を論理的に考える力が必要です。
// 検索して答えを探して解いても考える力には繋がりません。
// まずは検索に頼らずに自分で処理手順を考えてみましょう。

//また、【その処理が必要かどうか・適切かを考えるため、コメントアウトで一行毎に処理の内容を記述してください。】

//問.ふたつの配列を結合してひとつの配列にする関数を作成してください。
//例)[1, 2, 3]と[a, b, c]という配列→関数の返り値は[1, a, 2, b, 3, c]

$numbers = [1, 2, 3];
$alphabets = ['a', 'b', 'c'];

function combineMixedArray($firstArray, $secondArray) {
    // ループする回数
    $count = count($firstArray) >= count($secondArray) ? count($firstArray) : count($secondArray);
    for ($i = 1; $i <= $count; $i++) {
        // array_shiftで先頭を抜き出して$resultという配列に格納した後に抜き出した先頭を削除する
        $result[] = array_shift($firstArray);
        $result[] = array_shift($secondArray);

        // $firstArrayと$secondArrayの配列が無くなった場合
        if (!$firstArray && !$secondArray) {
            break;
        }
    }

    return $result;
}

print_r(combineMixedArray($numbers, $alphabets));

// ポイント：配列と配列を結合して1つの配列になっているか
// ポイント：この関数の引数に2つの配列を渡す引数があるか(引数が2つあるか)
// ポイント：ループ文を使用して配列を結合しているか
