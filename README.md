## NJS　-南山大学性のための情報サイト-
南山大学のイベント情報、楽単情報、サークル情報を共有できるアプリケーションです。<br>
部活・サークル関係者にボタン１つで自分の情報を送れますし、楽単情報は教師名・講義名の両方から検索可能です。<br>
レスポンシブ対応しているので、スマホからも確認いただけます。

## デモ動画
![Videotogif-9](https://user-images.githubusercontent.com/77489664/120893530-c2a0d100-c64e-11eb-9104-0dbb246c3904.gif)

## URL
[NJSへようこそ](http://ec2-35-73-250-89.ap-northeast-1.compute.amazonaws.com)

## 使用技術
* Ruby 2.6.3
* Ruby on Rails 6.0.3
* AWS
  - VPC
  - EC2
* Nginx
* Unicorn
* MariaDB
* Docker/Docker-compose
* CircleCI
* RSpec

## 機能一覧
○一般ユーザー
* ユーザー登録、認証機能（認証のmailerにはgmailを使っています。)
* パスワード変更機能
* 検索機能
* 楽単/問い合わせ情報の投稿機能
* ページネーション機能
* いいね機能

○管理者
* 画像投稿機能(carrierwave)

## テスト
* RSpec
  - 単体テスト(model)
  - 機能テスト(request)
  - 統合テスト(system)
