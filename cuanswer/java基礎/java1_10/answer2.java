//for文を使用して九九の計算を出力してください。
//※出力例　1×1=1　1×2=2…1×9=9
//　　　　　2×1=2　2×2=4…2×9=18
//     　　　・
//           ・
//         　・
//          9×1=9　9×2=18…9×9=81
package java1_10;

public class answer2 {

	public static void main(String[] args) {
		// TODO 自動生成されたメソッド・スタブ
		for(int i = 1; i < 10; i++) {
			for(int j = 1; j < 10; j++) {
				System.out.print(i +  "×" + j + "=" + i * j + "\t");
			}
			System.out.print("\n");
		}
	}

}