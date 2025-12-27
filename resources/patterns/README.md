# HAS Patterns Structure

このディレクトリには、HASの実践において参照される  
**性質の異なる二種類のパタン（パターン）**が格納されています。

パタンは、クリストファー・アレグザンダーのパタン・ランゲージにヒントを得た記述フォーマットで書かれています。

両者は目的・優先順位・安全性が根本的に異なります。
**混同してはなりません。**

---

## 1. State Patterns（状態パタン）

- **Directory:** [`state/`](./state/)
- **ID Prefix:** `Pxx_`（例: `P01_acceptance.md`）
- **Nature:** 定義 / 存在論 / 状態記述

### 説明

State Patterns は、HASが成立している「場の状態」を定義するものです  
（P01–P04）。

これらは以下を**一切含みません**。

- 行為の指示
- 手順
- 改善方法
- 実践テクニック

State Pattern が示すのは、

> **「今、この関係は壊れていないか」  
> 「選択可能性は保たれているか」**

という **状態の識別基準**と、**状態に留まり続けるための微調整**のみです。

State Patterns は HAS Kernel と直結しており、  
原則として変更・拡張されません。

---

## 2. Technique Patterns（技術パタン）

- **Directory:** [`techniques/`](./techniques/)
- **ID Prefix:** `Txx_`（例: `T01_grounding.md`）
- **Nature:** 提案 / 任意 / 補助的手段

### 説明

Technique Patterns は、特定の状況において  
**役に立つ可能性があるかもしれない行為の提案**です。

以下を理解した上でのみ参照されます。

- 使用は義務ではない
- 使わなくても HAS は成立する
- 効果は保証されない

Technique は常に **Doing** に傾きやすく、  
誤用すると容易に「操作」へと変質します。

---

## Priority Rule（優先順位規則）

HAS における優先順位は、常に以下の通りです。

HAS Kernel
> State Patterns (Pxx)
>> Technique Patterns (Txx)

Technique Patterns は、  
State Patterns および Kernel の **下位** に位置します。

---

## The Override Clause（上書き禁止条項）

いかなる Technique（Txx）も、  
HAS Kernel（憲法・禁忌・選択可能性原則）に  
**優先してはなりません。**

以下のいずれかが生じた場合、その Technique は即時停止されます。

- 操作している感覚が生じた
- 相手の選択肢が狭まった
- 誘導・正解探し・安心させる義務感が発生した

> **HAS において、  
> Core に違反するテクニックは  
> その効果に関わらず「欠陥（Bug）」とみなされます。**

State を無視して Technique を適用することは、  
HAS の使用ではありません。