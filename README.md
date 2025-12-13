# Human Attunement System (HAS)
> **Documentation & Resources**

HASは、組織と個人を「管理(OS)」するのではなく、  
**「調律(Attunement)」によって関係と状態を整える体系**です。

このREADMEは、目的別に「どこを読めばいいか」を示します。

---
## ディレクトリ構造とレイヤの意味

HASは、明確に分離された3つのレイヤから構成される。
**この構造を変更・再解釈してはならない。**

### レイヤ1: `core/` — Kernel（変更困難）
- HAS v2.0 Final のみを配置
- 存在論・憲法・禁忌を含む
- **変更不可（Sealed）**
- 更新は、重大な欠陥が発見された場合のみ

### レイヤ2: `docs/` — 思想＋安全仕様
- Manifesto, Concept, Principles, Levels, FAQ, Glossary
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
- 増殖・派生を許容（ただしKernelとの整合性は必須）

---

**重要:** 
- Protocolが「Doing」を含むのは、HASカーネル外だから許容される
- 「HASはDoingを定義しない」は、Kernel/Docsレイヤのみに適用される
- この分離により、思想の純度と運用安全性が両立する

---

## 0. 全体像を掴む (Map)
まず全体構造を把握したい人向け。
* **[01_architecture_map.md](./docs/01_architecture_map.md)**  
  HAS全体の構造・循環・文書間の関係を示す地図。

---

## 1. 思想を知る (Philosophy)
HASの前提となる人間観・価値観・立場を理解する。
* **[00_manifesto.md](./docs/00_manifesto.md)**  
  HASの宣言文。何を大切にし、何を選ばないか。
* **[02_concept.md](./docs/02_concept.md)**  
  なぜ「調律」なのか。調整・適応・適合との違い、OSとTSの違い。

---

## 2. 在り方を整える (Being)
実践者(ファシリテーター)が、技法の前に整えるべき姿勢。
* **[04_facilitator_principles.md](./docs/04_facilitator_principles.md)**  
  原則と戒律。HASを壊さないための制約条件。
* **[03_attunement_levels.md](./docs/03_attunement_levels.md)**  
  慣れの段階。初心者から実践者までの学習ガイド。

---

## 3. よくある疑問を解消する (FAQ)
「成果は?」「即効性は?」と感じた人へ。
* **[05_faq.md](./docs/05_faq.md)**  
  OS的な問いを、TSの視点で読み替えるQ&A。
* **[06_glossary.md](./docs/06_glossary.md)**
* HASの用語についての、やや詳しい説明。

---

## 4. パタンを学ぶ (Core Patterns)
HASの中核となる実践パタン。
初めて使う場合は、**順番に通読**することを推奨。
* **[P01: 感情の受容](./resources/patterns/state/P01_acceptance_of_emotion.md)**
* **[P02: 感情の分化](./resources/patterns/state/P02_differentiation_of_emotion.md)**
* **[P03: 沈黙の充満](./resources/patterns/state/P03_fullness_of_silence.md)**
* **[P04: 引受の成立](./resources/patterns/state/P04_establishment_of_ownership.md)**

---

## 5. 事例を見る (Scenarios)
HASが具体的な状況（家庭、職場など）でどう機能するかを知る。
* **[scenarios/](./resources/scenarios/)**
  状況別の実践シナリオ集。（現在準備中）

---

## 6. 現場で使う (Quick Reference)
会議中・迷った瞬間の即参照用。机に置いておく紙。
* **[quick_reference.md](./resources/quick_reference.md)**
  4つのパタンの核心だけを1ページに。兆候と自己点検のみ。

---

## 7. よくある疑問を解消する (FAQ)
「成果は?」「即効性は?」と感じた人へ。
* **[05_faq.md](./docs/05_faq.md)**
  OS的な問いを、TSの視点で読み替えるQ&A。
* **[06_glossary.md](./docs/06_glossary.md)**
  HASの用語についての、やや詳しい説明。

---

## 読み方のおすすめ

- **初見の人**
  Map → Manifesto → Concept → FAQ
- **実践したい人**
  Manifesto → Facilitator Principles → Levels → Patterns → Scenarios
- **現場で詰まった人**
  Quick Reference → 該当Pattern

HASは「正解を与える体系」ではありません。  
**状態を整え、選べるようにする体系**です。

---

## Document Control
* **Version:** 2.0.0
* **Date:** 2025-12-12