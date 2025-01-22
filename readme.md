# timeupp

設定した時間が来たらフォルダを自動コピーする

## 準備

* Windows のタスクスケジューラーで timeupp.bat を登録します。 (1分間隔で実行)
    * [全般] セキュリティ オプション: ユーザーがログオンしているかどうかにかかわらず実行する
    * [トリガー] 設定:毎日, 間隔: 1日, 繰り返し間隔: 1分間
    * [操作] プログラム/スクリプト: timeupp.bat, 開始: timeupp.bat のフォルダ


## 設定

timeupp.conf.xml を編集します。

```
<conf>
	<schedule date="2025/01/22" time="12:10" done="False">
		<from>C:\Users\someone\Documents\dev\proj1\timeupp\patch002</from>
		<to>C:\Users\someone\Documents\dev\proj1\release</to>
	</schedule>
	<schedule date="2025/01/21" time="12:10" done="True">
		<from>C:\Users\someone\Documents\dev\proj1\timeupp\patch001</from>
		<to>C:\Users\someone\Documents\dev\proj1\release</to>
	</schedule>
</conf>
```
* schedule 要素をコピーする
* date 属性を更新を行いたい日付にする
* time 属性を更新を行いたい時間にする (分単位)
* from 要素をコピー元のフォルダ(更新するものを置いたフォルダ)にする
* to 要素をコピー先のフォルダ(更新されるフォルダ)にする
* done 属性を False にする (Trueだとスキップ)