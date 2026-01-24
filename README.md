# Scroll 書き方ガイド - Cloudflare Pages デプロイ手順

## 概要
このディレクトリには、Scrollブログの書き方説明サイトが含まれています。
Cloudflare Pagesで静的サイトとして公開できます。

## ファイル構成
```
scroll_guide/
├── index.html          # メインの説明ページ
├── images/            # キャラクター画像（コピーが必要）
│   ├── scroll_logo.png
│   ├── voice-ninja1.png
│   ├── voice-ninja2.png
│   ├── voice-samurai.png
│   └── machi-musume.png
├── copy_images.sh     # 画像コピー用スクリプト
└── README.md          # このファイル
```

## 画像の準備

デプロイ前に、画像をコピーする必要があります：

```bash
# スクリプトを実行
chmod +x copy_images.sh
./copy_images.sh

# または手動でコピー
mkdir -p images
cp ../Scroll_introduction/images/*.png images/
```

## Cloudflare Pagesへのデプロイ手順

### 方法1: Cloudflare Pagesダッシュボードから直接アップロード

1. **Cloudflareダッシュボードにログイン**
   - https://dash.cloudflare.com/ にアクセス

2. **Pagesプロジェクトを作成**
   - 左メニューから「Pages」を選択
   - 「プロジェクトを作成」をクリック
   - 「フォルダーを直接アップロード」を選択

3. **プロジェクト設定**
   - プロジェクト名: `scroll-guide`（任意）
   - ビルドコマンド: （不要）
   - ビルド出力ディレクトリ: `/` または空白

4. **ファイルをアップロード**
   - `index.html` をアップロード
   - 「デプロイ」をクリック

5. **カスタムドメインの設定（オプション）**
   - プロジェクト設定 → カスタムドメイン
   - 例: `guide.hagakurepgm.net` を設定
   - **重要**: メインドメイン（`hagakurepgm.net`）は使わず、サブドメインを使用すること

### 方法2: Gitリポジトリから連携（推奨）

1. **Gitリポジトリにプッシュ**
   ```bash
   git add scroll_guide/
   git commit -m "Add Scroll guide site"
   git push
   ```

2. **Cloudflare PagesでGit連携**
   - Pagesダッシュボード → 「プロジェクトを作成」
   - 「GitHub」または「GitLab」を選択
   - リポジトリを選択
   - ビルド設定:
     - ビルドコマンド: （空白）
     - ビルド出力ディレクトリ: `scroll_guide`

3. **デプロイ**
   - 「デプロイ」をクリック
   - 自動的にデプロイされます

## カスタムドメイン設定時の注意

⚠️ **重要**: メインドメイン（`hagakurepgm.net`）を直接使用すると、メインサイトが閲覧不能になる可能性があります。

**推奨**: サブドメインを使用
- `guide.hagakurepgm.net`
- `howto.hagakurepgm.net`
- `help.hagakurepgm.net`

## 更新方法

### 直接アップロードの場合
1. `index.html` を編集
2. Cloudflare Pagesダッシュボードから再アップロード

### Git連携の場合
1. `index.html` を編集
2. Gitにコミット・プッシュ
3. 自動的に再デプロイされます

## ローカルで確認

ブラウザで `index.html` を直接開くか、ローカルサーバーで確認：

```bash
# Python 3の場合
cd scroll_guide
python -m http.server 8000

# ブラウザで http://localhost:8000 にアクセス
```

## カスタマイズ

- **色の変更**: `<style>` タグ内のカラーコードを変更
- **コンテンツの追加**: HTML内の各セクションを編集
- **テンプレートの追加**: 「テンプレート集」セクションに新しいテンプレートを追加

## トラブルシューティング

### デプロイ後、ページが表示されない
- ビルド出力ディレクトリの設定を確認
- `index.html` がルートディレクトリにあることを確認

### カスタムドメインが反映されない
- DNS設定を確認（CNAMEレコード）
- CloudflareのDNS設定でプロキシが有効になっているか確認

## 参考リンク

- [Cloudflare Pages ドキュメント](https://developers.cloudflare.com/pages/)
- [Scrollブログサイト](https://hagakurepgm.net/blog/)
