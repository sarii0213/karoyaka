# :dove: karoyaka
karoyakaの目的は、ものを手放す活動 ー 捨て活 の習慣化をサポートすること。

<br>

## 📱 アプリURL
https://karoyaka.site/  
↑ ユーザー登録をすることで、全ての機能を使えます。  
　入力項目のメールアドレスは受信確認はしないので、覚えておけるものなら仮のアドレスで登録するのでも大丈夫です。


<br>

## 💭 なんで 捨て活？
- 結論： 自由で快適な生活を送るため
- 背景： 消費主義に流されるままにたくさんのモノに囲まれ、モノに支配された生活を送っている人は少なくない
  - モノに支配された生活： どこに何があるかの全てを把握できておらず、モノ探しや片付け・収納方法の思案に時間と労力を費やし、自律神経を乱す日々。掃除しなきゃと思いつつほこりを見て見ぬフリ。身の回りをキレイにできないことで自己否定に陥ったり…etc
- 「モノが多くても整頓できていればOKでは？」 → モノが多いと、収納・片付けのハードルが上がり、整った暮らしは険しい道のりに
- **モノを減らすことは、シンプルでストレスの少ない、軽やかで快適な暮らしへの近道**
- モノを手放す習慣がつくことで、衝動買いも減り、整った生活がラクに継続できる

<br>

## 🧍 想定するユーザー
- 散らかった部屋は嫌だけど、片付けは苦手
- 頑張って片付けてもなぜかすぐに散らかる
- ミニマリスト・シンプリストに憧れる
- 整った暮らしを送る人のブログや動画を見るのは好きだけど、実行に移せない

<br>

## 🤷 ユーザーが持つ課題
- まず何をしたらいいかわからない
- 片付け・ものを減らす習慣がつかない
- 今持っているものを手放すのは、頭を使って考える必要があったりハードルが高くてやる気にならない
- なんかいろいろ面倒・手間がかかって大変そう

<br>

## 🔑 捨て活サポートのアプローチ
- **捨て活のハードルを下げる**
  - 捨て活のタスクを最小サイズにし、実現可能性を高める
    - 1日に1つ手放せるものを見つける、「1日１捨」を目標に掲げる
    - 捨て活を２つのステップに分ける
      - ステップ① 手放せるものを見つける
      - ステップ② 実際に処分する  
      
  - 捨て活の手間をできる限り少なく
    - 捨て活のハードルの高さの一因は、何を手放すか、どう手放すかなど考えなきゃいけないことが多いこと
    - 手放したいものを登録する過程（＝ジャンル・方法・理由の選択）で、自分の中に手放す基準を確立していける  
    （どんなジャンルのものをどんな理由、どんな方法で手放せるのかの感覚を掴んでいけて、手放すものを見つけるのが簡単になっていく）
    - 手放したいもの・手放し済みのものの登録工程も最小限の入力で済むようになっている（ジャンル・理由・方法を選択すればOK）  
    
  - 喪失感の緩和
    - 手放すものの写真を撮れる機能によって、記録に残すことができた実感から、実体を手放す抵抗感が薄まる  
    
- **捨て活を習慣づける**
  - 捨て活を何日続けられているのか、どんなものを手放せたのか実績を視覚的・数値的に確認でき、達成感を得られる
  - やる気の出ない時に眺められる、捨て活のモチベーションを上げる名言集を用意

<br>

## 📝 今後追加したい機能
- 手放したいもの・手放し済みのもの一覧画面に絞り込み機能
- 捨て活モチベを上げる名言や捨て活のヒントやリマインダーをLINEで配信する機能
- アップロードした画像の分析機能（どんなものが映っているのか候補を表示）← 必要か？

<br>

## 💿 DB設計
![db_20230206](https://user-images.githubusercontent.com/105996822/216992444-b4d614cf-6cf2-47ec-8fd4-577a4780c27a.png)
↑ クリックして拡大

- [Mermaid記法のコード](https://github.com/sarii0213/karoyaka_sketch/blob/main/db_architecture.md)

<br>

## 🔗 エンドポイント設計
[karoyaka エンドポイント - Googleスプレッドシート](https://docs.google.com/spreadsheets/d/1zr-zw30afOB7XARiWX79aH-iVoj1HBa22X23bARWLJY/edit?usp=sharing)

<br>

## 🦾 使用技術
### バックエンド
- Ruby 3.1.2
- Rails 7.0.4
- RSpec 3.12

### フロントエンド
- HTML
- SCSS
- JavaScript

### データベース
- MySQL
- Redis

### アプリケーションサーバ
- Puma

### コンテナ管理
- Docker

### CI
- GitHub Actions

### ユーザー認証
- Devise

### デコレータ
- draper

### 画像アップロード
- ActiveStorage

### 画像ストレージ
- Amazon S3

### バックグラウンドジョブ
- Sidekiq

### コード解析
- RuboCop
- Erblint

### テスト
- RSpec

### デプロイ
- Heroku

<br>

## 🔧 環境構築
- リポジトリのクローン
```sh
$ git clone git@github.com:sarii0213/karoyaka.git
```

- Dockerコンテナ起動
```sh
$ docker-compose up
```

- Gemインストール
```sh
$ docker-compose run --rm web bundle
```

- データベース作成
```sh
$ docker-compose run --rm web bin/rails db:create
```

- シードデータを反映
```sh
$ docker-compose run --rm web bin/rails db:seed_fu
```
