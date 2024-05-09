# アプリケーション名 
SQU-App（すくあっぷ）

# アプリケーション概要 
岡山アカペラサークル「SQUARE」において運営の基盤となる機能を備えたウェブアプリケーションです。  
下記の機能を実装または実装予定です。

- 自動バンド分け機能
- 定期活動会用楽譜閲覧機能
- ユーザー管理機能（新規登録、ログイン、情報変更）
- 外部リンク（X、Instagram、YouTube）
- サークル説明ページ（概要、主催イベント）

# URL
https://suq-app.onrender.com

### テスト用アカウント
メールアドレス：123@gmail.com<br>
パスワード    ：fvji0301
### Basic認証（会員専用ページ）
ID：square<br>
PASS：1111

## ユーザー管理機能（新規登録、ログイン、情報変更）
1. 「会員専用ページはこちら」をクリックします。
2. Basic認証をIDとパスワードを入力し、ログイン画面へ遷移します。
3. メールアドレスとパスワードを入力してログインできます。  
※ログインするとヘッダーに名前が表示されます。
4. ログイン画面で「新規登録はこちらから」をクリックすると、新規登録画面へ遷移します。
5. 必要事項を入力して新規登録できます。
6. ログインした状態でトップ画面右下の「ユーザー情報の変更」カードの「こちらから」をクリックするとユーザー情報変更画面へ遷移します。  
※非ログイン時は非表示。
7. 「ログアウト」をクリックしてログアウトします。

## 自動バンド分け機能
1. ログイン状態で左下の「定期活動会参加登録」カードの「こちらから」をクリックします。  
※非ログイン時は非表示。
2. 「曲の追加・削除」ボタンをクリックして曲名追加・削除ページへ遷移します。  
曲名を入れて追加ボタンを押すと曲名カラムが追加されます。  
削除ボタンを押すと対象の曲名カラムが消えます。  
※曲名を削除すると曲名カラムに入力されたパートは一時的に消えますが、  
別の曲名を入れるとそこに元々入力してあったパートが反映されます。  
※2曲が上限でそれ以上入れようとするとポップアップ表示。
3. 「参加者登録」ボタンをクリックして参加者登録ページへ遷移します。  
ニックネームを入力（初期値はログインユーザー名）し、パートを選ぶとニックネームごとに曲ごとの希望パートが表示されて参加登録ができます。  
ニックネームをクリックすると本人のみ編集、削除ができます。  
※この操作は参加者が行うことを想定しています。
4. 「バンドを分ける」ボタンをクリックしてメンバーをシャッフルした上で曲ごとに必要なバンド数分バンドを生成して表示します。  
※ページを更新すると再生成されます。  
※この操作は主体者が行うことを想定しています。
5. 「リセット」ボタンを押してパスワードを入力すると入力内容がすべて消えます。  
※毎月行うイベントのためこの機能を実装します。  
※この操作は主体者が行うことを想定しています。

## 各種リンク機能
- ヘッダーの「Follow on X」をクリックするとサークルのXのページに遷移します。
- ヘッダーの「Like on Instagram」をクリックするとInstagramのページに遷移します。
- 「活動の様子を動画で見る」カードの「もっと見る」をクリックするとYouTubeチャンネルに遷移します。
- ログイン状態で「定期活動会楽譜」カードの「こちらから」をクリックするとGoogleDriveの楽譜フォルダに遷移します。  
※コードは環境変数に設定したURLを読み込むようにし、URLが流出しないようにしています。  
※現在はテストページへのリンクを設定しています。

## 各種概要説明ページ
- ログイン状態に関わらず「SQUAREについて」「定期活動会」「Okayama Music SQUARE」「スターターバンド・アシスト制度」について詳しく見ることができる。
- それぞれからお互いのページにいつでも遷移できる。


# 作成した背景
- サークル運営に際してX、Instagram、YouTube、LINE、Google DriveなどさまざまなSNSやツールを使い分けていて管理が大変という課題がありました。
- 月に一回集まり事前に共有した楽譜で歌う「定期活動会」というイベントがあり、20人前後の参加者を即席バンドに分けるという作業に時間がかかるという課題がありました。
- 他にも多数の課題があり、それらを解決するにはサークルの基盤になるようなサービスが必要だと思い、実用化を見据えて実装に取り組みました。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/bccf52beecfe1b3a7a966a560ec1e5ef.png)](https://gyazo.com/bccf52beecfe1b3a7a966a560ec1e5ef)


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/176ea30e0039ec4d0d2564d87d4d37c3.png)](https://gyazo.com/176ea30e0039ec4d0d2564d87d4d37c3)

# 開発環境
- Ruby 3.2.0
- Rails 7.0.0
- bootstrap 5.2.3

# ローカルでの動作方法

1. リポジトリをクローンします。  
% git clone https://github.com/KITASHA/SUQ-App.git

2. プロジェクトのディレクトリに移動します。  
% cd SQU-App

3. 必要なGemをインストールします。  
% bundle install

4. アセットのプリコンパイルをします。  
% rails assets : precompile

5. データベースをセットアップします。  
% rails db:create db:migrate

6. サーバーを起動します。  
% rails s

7. ブラウザで `http://localhost:3000` を開いて、アプリケーションにアクセスします。

# 工夫したポイント
- 実用性を意識して実装しました。
- 誰でも閲覧できる部分と、ログインしないと使用・閲覧できない部分を分けました。
- 機能を拡張することを見据えてデザインしました。
- バンド分け機能の仕様にこだわりました  
必要なバンド数を自動で計算して生成します。  
曲が1曲しかない場合や、参加者が1曲しかしない場合も対応可能です。  
パートが5つ以下の曲でも対応可能です。

# 改善点
- 下記の機能を改善すれば実用化が可能です。  
現在の仕様では1曲につき1パートしか選べません（bassかV.P.どちらかを希望などには対応できない）。  
バンド分けの結果を画像で保存する機能が未実装です。
- 未実装の機能はたくさんありますので、継続して実装していく予定です。

# 制作時間
現在50時間程度