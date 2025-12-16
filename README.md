# Human Attunement System (HAS)
> **Documentation & Resources**

HASは、組織と個人を「管理(OS)」するのではなく、  
**「調律(Attunement)」によって関係と状態を整える体系**である。

> **OS (Operating System)**: 効率・最適化・管理を目的とする  
> **TS (Tuning System)**: 状態・共鳴・回復を目的とする  
> 
> これは「OSが悪でTSが善」という対立ではない。  
> 目的関数が異なるだけであり、緊急時・定型業務ではOSが適している。  
> 詳細は [Concept](./docs/02_concept.md) を参照のこと。

**このREADMEは案内である。仕様ではない。**

---

## ディレクトリ構造とレイヤの意味

HASは、明確に分離された4つのレイヤから構成される。  
**この構造は設計意図であり、変更する場合はForkとして行うことを推奨する。**

### レイヤ1: `core/` — Kernel（Sealed）

- HAS v2.0 Final のみを配置
- 存在論・憲法・禁忌を含む
- **Sealed（原則として変更不可）** — 更新は重大な欠陥発見時のみ

### レイヤ2: `docs/` — 思想＋安全仕様

- Manifesto, Concept, Facilitator Pitfalls, Attunement Map, FAQ, Glossary
- Failure Modes（事故カタログ）
- Exit and Unsuitability（離脱の自由）
- **Kernelより更新しやすいが、慎重に行う**
- Doingを含まない（状態・制約・禁忌のみ）

### レイヤ3: `governance/` — 運用手続き（Kernelの外）

- Protocols（Emergency Stop, Steward Judgment, Maintenance, PR）
- ADR（設計判断の記録）
- **Doingを含むが、HAS本体ではない**
- HASを壊さないための運用ガイド

### レイヤ4: `resources/` — 道具箱

- Patterns（State / Techniques）
- Scenarios, Quick Reference
- 実践・検索・発見のためのインターフェース
- 増殖・派生を許容  
  （※「HAS準拠」を名乗る場合のみ、Kernelとの整合性が必須）

---

**設計意図:** 
- Protocolが「Doing」を含むのは、HASカーネル外だから許容される
- 「HASはDoingを定義しない」は、Kernel/Docsレイヤのみに適用される
- この分離により、思想の純度と運用安全性が両立する

詳細は [ADR-002: Separation of Philosophy and Practice](./governance/adr/HAS-ADR-002_separation_of_philosophy_and_practice.md) を参照。

---

## 最短導線（状況別の入口）

### 初めての人
→ [Architecture Map](./docs/01_architecture_map.md) で全体像を掴む  
→ [Manifesto](./docs/00_manifesto.md) で価値観を理解  
→ [FAQ](./docs/06_faq.md.md) で疑問を解消

### 実践したい人
→ [Facilitator Pitfalls](./docs/05_facilitator_pitfalls.md) で陥りやすい落とし穴を把握  
→ [Attunement Map](./docs/04_attunement_map.md) で位置の識別を理解  
→ [Patterns P01-P04](./resources/patterns/state/) で実践開始  
→ [Failure Modes](./docs/08_failure_modes.md) で事故を予防

### 現場で詰まった人
→ [Quick Reference](./resources/quick_reference.md) で即参照  
→ [Failure Modes](./docs/08_failure_modes.md) で自己点検  
→ [Emergency Stop](./governance/protocols/emergency_stop.md) で緊急対応

### 向いていないと感じた人
→ [Exit and Unsuitability](./docs/08_exit_and_unsuitability.md) で離脱を正当化  
→ [FAQ](./docs/06_faq.md.md) で「向いていない状況」を確認  
→ **"If not now, forget it."** — 今じゃないなら、無理に続けなくてよい

---

## HASとは何か？（思想の要約）

HASは「正解を与える体系」ではない。  
**状態を整え、選べるようにする体系**である。

- 人を救わず、人を導かず、人を完成させない
- ただ、人が壊れる関係だけを許さない
- そして、人が選べる時にのみ、その背中を見届ける

---

## 名称使用とFork

HASの名称使用については、以下のプロトコルに従う。

### 基本方針
- **「HAS準拠」の使用は、プロトコルに基づき判定される**
- **派生（Fork）は自由だが、独自の名称を推奨する**
- **影響関係の明示（「HAS由来」等）は歓迎する**

### 詳細と判定手続き
名称使用の具体的なルールと判定プロセスは、以下のプロトコルで定義される。

- [Public Relations Protocol](./governance/protocols/public_relations.md) — 広報・名称使用の作法
- [Steward Judgment Protocol](./governance/protocols/steward_judgment.md) — 「HAS準拠」判定の手続き

### ライセンス
（※実際のライセンスファイルへのリンクを設置予定）

---

## ディレクトリ構造

HAS/
├── core/
│   └── HAS_v2.0_Final.md              # 核となる最終仕様
├── docs/
│   ├── 00_manifesto.md
│   ├── 01_architecture_map.md         # 全体設計図
│   ├── 02_concept.md
│   ├── 04_attunement_map.md           # 位置の識別（旧: attunement_levels）
│   ├── 05_facilitator_pitfalls.md      # 陥りやすい落とし穴（旧: principles）
│   ├── 06_faq.md.md
│   ├── 07_glossary.md
│   ├── 08_failure_modes.md            # 事故カタログ
│   └── 08_exit_and_unsuitability.md   # 離脱の自由
├── governance/
│   ├── adr/
│   └── protocols/
├── resources/
│   ├── patterns/
│   │   ├── state/                     # P01–P04（Core）
│   │   ├── techniques/                # 任意
│   │   └── README.md
│   ├── scenarios/
│   └── quick_reference.md
└── README.md

## リンク整合性の確認

このREADMEのリンクが正しいか確認するには、以下を実行する。
```bash
# 例: markdown-link-check を使用
# （実際の環境に応じて、package.json のスクリプトまたはCIで実行）
npx markdown-link-check README.md
```

**注意:** README内に検証結果を記載すると、陳腐化により誤情報となる。  
リンクチェックは実行可能なスクリプトまたはCIで担保すること。

詳細は、リポジトリ設置後の `.github/workflows/` または `package.json` を参照のこと。

---

## Document Control

- **Version:** 2.1.0
- **Last Updated:** 2025-12-15
- **Status:** Active
- **Kernel Version:** v2.0 Final (Sealed)
- **Major Changes:**
  - Attunement Levels → Attunement Map（段階から位置へ）
  - Facilitator Principles → Facilitator Pitfalls（陥りやすい落とし穴の明示）
  - 新規文書追加: Failure Modes, Exit and Unsuitability
---

## Contact & Feedback

- **Steward Contact:** human.attunement__at__gmail.com

---

**"If not now, forget it."**  
今、必要でなければ、忘れてよい。  
必要になった時、また戻ればよい。