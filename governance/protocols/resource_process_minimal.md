# Minimal Release & Versioning Procedure
**HAS 文書リポジトリ運用手順（単独世話人向け）**

## この手順書の目的

本手順書は、Human Attunement System（HAS）の文書群において、

- 思考・設計の「区切り」を明示する
- バージョン番号を一貫したルールで扱う
- 人為ミス（タグ忘れ・順序ミス）を回復可能にする

ための **最小限の運用プロトコル**を定義する。

厳密なリリース管理ではなく、  
**未来の自分が混乱しないための儀式**である。

---

## 基本原則

1. **バージョン番号はリポジトリタグで管理する**
   - 文書個別に手動で番号を付けない
2. **Document Control は Git の事実から自動生成する**
   - 人間は編集しない
3. **タグは「区切り」のときだけ打つ**
   - 毎回は不要

---

## 用語

- **Release Commit**  
  思考や構造が一段落したことを示す専用コミット
- **Tag**  
  `vX.Y.ZZ` 形式の注釈付き Git タグ
- **Document Control**  
  文書末尾に自動注入されるメタ情報ブロック

---

## 通常のリリース手順（推奨）

### 前提
- 変更内容に納得している
- 「ここで一区切り」という判断ができている

---

### 手順

#### 1. リリーススクリプトを実行
```bash
./scripts/release.sh X.Y.ZZ

例：

./scripts/release.sh 2.1.00

このスクリプトは以下を自動で行う。
	1.	tools/update_doc_control.py を実行
	•	Document Control に以下を注入
	•	Repo Version（タグベース）
	•	Last Modified
	•	Commit
	•	Author
	2.	差分があれば release 用コミットを作成
	•	コミットメッセージ例：

chore(release): v2.1.00


	3.	そのコミットに注釈付きタグ v2.1.00 を作成

⸻

2. push

git push
git push --tags


⸻

後からタグを付ける場合（タグ打ち忘れ）

状況
	•	本来リリースすべき区切りがあった
	•	その後、別のコミットを積んでしまった

原則

正しい過去コミットにタグを付ける。

⸻

手順

1. 対象コミットを確認

git log --oneline --decorate

2. 後付けタグを作成

./scripts/tag_at.sh X.Y.ZZ <commit>

例：

./scripts/tag_at.sh 2.1.00 a1b2c3d

3. push

git push --tags


⸻

バージョン番号の注入について

何が注入されるか

Document Control には、以下の Git 由来の事実のみが入る。
	•	Repo Version
	•	git describe --tags --always
	•	Last Modified
	•	対象ファイルの最終更新日
	•	Commit
	•	対象ファイルの最終更新コミット
	•	Author
	•	最終更新者

重要な注意
	•	MAJOR / MINOR / PATCH の判断は 人間が行う
	•	スクリプトは番号を決めない
	•	スクリプトは 決まった番号を記録するだけ

⸻

よくある例外と扱い

タグ後に Document Control 更新コミットが入った
	•	許容する
	•	Document Control は「事実」なので矛盾ではない
	•	次回から通常手順に戻す

⸻

間違ったタグを打った
	•	push 前
	•	削除して付け直してよい
	•	push 後
	•	原則タグは動かさず、新しい正しいタグを追加する

⸻

最小ルール（これだけ守る）
	1.	タグは区切りのときだけ打つ
	2.	タグは必ず特定のコミットを指す
	3.	Document Control は人間が編集しない

⸻

補足

このプロセスは、
他者のための統制ではなく、自分の思考を保存するための装置である。

厳密さより、続けられることを優先する。

---

これで、

- **何をいつやるか**
- **ミスったらどう戻るか**
- **自動化と人間判断の境界**

が一望できる。

あとは、淡々と使うだけ。

<!-- DOCCTRL:START -->
## Document Control
- **Repo Version:** v2.4.3-1-gc67ec6fd-dirty
- **Last Modified:** 2025-12-26
- **Commit:** be7aeaf
- **Author:** Takeshi Kakeda
<!-- DOCCTRL:END -->