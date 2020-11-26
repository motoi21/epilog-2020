# README
# 絵ピローグ
描いた絵やイラストを誰でも簡単に投稿し、それを売買することもできるサイトです。
下記ページで公開中です。
https://epilog-2020.herokuapp.com/

## アプリ概要
自分で描いた絵やイラストを投稿できたり、価格をつけて投稿することで売買することも可能にし、イラストの依頼も行うことができるサイトです。
・誰でもユーザー登録すれば画像を投稿できる
・絵やイラストを売却、購入することができる機能の実装
・お気に入りのユーザーに自分だけの絵やイラストを依頼できる機能を実装
・投稿したイラストや、受けた依頼をマイページで管理できる機能を実装
Ruby on Railsで制作しました。

## 作成した背景や想いなど
私の友人に美大生だった方がおり、練習や試作で描いた絵が余ってしまい処分に困っているという悩みを聞き、「こういったサービスがあれば絵を描く人たちの環境が良くなるのでは」という思いつきから。
具体的には以下の通りです。
1. 描いた絵やイラストのみを売買する代表的なサービスがない
2. SNSやフリマサイトの欠点を補えるサービスを
3. 能力のある人が日の目を浴びれるように

### 1.描いた絵やイラストのみを売買する代表的なサービスがない
私の友人に美大生だった方がおり、練習や試作で描いた絵が余ってしまい処分に困っているという悩みを聞きました。しかしこれらは、素人目で見るととても上手で、部屋に飾ってもいいなと思えるようなものでした。
またイラストレーターなども厳しい世界であり、売れっ子となれるのはほんの一握りで、夢を諦めてしまう人も多いと聞きます。にも関わらず、ある調査での「女性のなりたい職業ランキング」では1位の「女優・モデル業」に次いで、２位は「絵を描く仕事」というのを知りました。
このようなことから、絵を描く人たちが自分の絵を投稿し、少しでも好きなことが続けられるように、かつ少しでも収入が得られるようなサービスを作ってみようと思いました。

### 2. SNSやフリマアプリの欠点を補えるサービスを
先述の友人は、在庫を売るとしたらハンドメイドのフリマアプリのようなサイトを使うことを考えていましたが、他にも様々なジャンルがあり絵はなかなか厳しいようだったので、絵を投稿して、もし気に入ってもらえたらすぐに売れるようなシステムを作りたいと考えました。
イラストレーターは現在だとTwitterを中心にダイレクトメッセージのやり取りなどで、案件をもらうことが多いようです。そこで自分が好きに描いたイラストを売ることができ、案件として依頼されたイラストでも収入が得られるようなサービスがあれば面白いのではないかと思いました。
絵やイラストを買う人たちも、SNSやアプリでいちいち検索するのではなく、一箇所に絵を描く人が集約していて、購入や依頼ができるサイトがあれば便利だと考えられます。

### 3. 能力のある人が日の目を浴びれるように
実力があるのになかなか日の目を浴びることができず、好きなことを諦めてしまう。どの世界にもよくあることですが、実力のある人たちが日の目を浴びれるように、自分のページを作品のギャラリーのように使える、他者からレーティングという形で評価され、高い評価を得れば、それがすぐにわかるようなサイトを作りたいと考えました。

## 機能
Ruby on Railsで制作したアプリです。
- イラスト投稿機能：絵を投稿でき、価格を付けて出品することができます。購入したいユーザーが表れてから、後ほど価格を設定することもできます。
- イラスト制作依頼機能：気に入ったユーザーに自分だけのイラストや絵を依頼することができます。
- マイページ機能：投稿したイラストを一覧で確認できる機能や、受けた依頼を確認できます。
- イラスト購入機能：気に入った絵をクレジットカード決済で購入することができます。

## 実装予定機能
- コメント機能：作品にコメントをすることができ、その作品を出品してもらうことができるようにもなります。
- レーティング機能：コメントにレーティングも付けて、ユーザーの作品を評価することができます。
- ユーザー検索機能：評価の高いユーザーや得意なジャンルなどからユーザーを検索することができ、依頼がしやすくなります。

## 使い方
### イラスト投稿
1. 新規投稿ボタンから新規投稿ページへ
2. 必要な情報を入力し、投稿ボタンをクリック
### 制作依頼
1. 依頼をしたいユーザーのマイページへ
2. マイページの依頼一覧画面から、「依頼する」をクリック
3. 必要な情報を入力し依頼を作成する。

## ローカル環境へのインストール方法
※Railsの場合
```
$ git clone <GitHubのURL>
$ cd <アプリ名>
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

## ER図
https://i.gyazo.com/899545b32227bd2fac72faf97cea08d5.png

## その他
現在も開発を継続しており、順次実装予定です。  

## 作者
mail to: [on86.motoi.uehara@gmail.com](on86.motoi.uehara@gmail.com)


## テーブル設計
### users テーブル
|Column                 |Type     |Options                       |
|-----------------------|---------|------------------------------|
| nickname              | string  | null: false                  |
| email                 | string  | null: false, unique; true    |
| password              | string  | null: false                  |
| password_confirmation | string  | null: false                  |
#### Association
- has_one  :profile
- has_many :drawings
- has_many :reviews
- has_many :offers
- has_many :purchases
### profiles テーブル
|Column                 |Type        |Options                       |
|-----------------------|------------|------------------------------|
| introduction          | text       |                              |
| user_image            |            | ActiveStorage,AWSを使用       |
| category_id           | integer    | null:false, ActiveHashを使用  |
| genre_id              | integer    | null: false, ActiveHashを使用 |
| user                  | references | foreign_key: true            |
#### Association
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :genre
### drawings テーブル
|Column              |Type        |Options                       |
|--------------------|------------|------------------------------|
| drawing_image      |            | ActiveStorage,AWSを使用       |
| title              | text       | null: false                  |
| description        | text       |                              |
| category_id        | integer    | null: false, ActiveHashを使用 |
| genre_id           | integer    | null: false, ActiveHashを使用 |
| production_date    | date       | null: false, ActiveHashを使用 |
| price              | integer    |                              |
| shipping_method_id | integer    | ActiveHashを使用              |
| height             | string     |                              |
| width              | string     |                              |
| user               | references | foreign_key :true            |
#### Association
- belongs_to :user
- has_many :reviews
- has_one :purchase

- belongs_to_active_hash :category
- belongs_to_active_hash :genre
- belongs_to_active_hash :shipping_method
### offers テーブル
|Column             |Type          |Options                      |
|-------------------|--------------|-----------------------------|
| budget            | string       | null:false                  |
| order_name        | string       | null:false                  |
| category_id       | integer      | null:false,ActiveHashを使用  |
| genre_id          | integer      | null:false,ActiveHashを使用  |
| detail            | text         | null:false                  |
| deadline          | date         | null:false                  |
| creater_id        | integer      |                             |
#### Association
- belongs_to :user
- has_one :review
- belongs_to_active_hash :category
- belongs_to_active_hash :genre
### purchases テーブル
|Column   |Type        |Options                    |
|---------|------------|---------------------------|
| user    | references | foreign_key :true         |
| drawing | references | foreign_key :true         |
#### Association
- belongs_to :user
- belongs_to :drawing
- has_one :shipping
### shipping テーブル
|Column         |Type        |Options                       |
|---------------|------------|------------------------------|
| postal_code   | integer    | null: false                  |
| prefecture_id | integer    | null: false, ActiveHashを使用 |
| city          | string     | null:false                   |
| address       | string     | null: false                  |
| building      | string     |                              |
| phone_number  | integer    | null: false                  |
| purchase      | references | foreign_key: true            |
#### Association
- belongs_to purchases

- belongs_to_active_hash :prefecture
### reviews テーブル
|Column        |Type         |Options                   |
|--------------|-------------|--------------------------|
| rating       | integer     | null: false              |
| text         | text        | null: false              |
| user_id      | references  | foreign_key: true        |
| drawing_id   | references  | foreign_key: true        |
| offer_id     | references  | foreign_key: true        |
#### Association
- belongs_to user
- belongs_to drawing
- belongs_to offer
