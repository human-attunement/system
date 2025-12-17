# Versioning Policy
**HAS Documentation Version Numbering Rules**

Status: Active  
Applies to: All HAS core documents (Manifesto, Kernel, Principles, Pitfalls, etc.)

---

## 目的

本ドキュメントは、Human Attunement System（HAS）における  
**思想・設計ドキュメントのバージョン番号採番ルール**を定義する。

HASは思想体系であると同時に、  
判断・運用・適用を伴う設計体系であるため、  
ソフトウェア開発と同等の変更管理が必要である。

---

## バージョン形式

HASのドキュメントは、以下の形式でバージョンを付与する。

MAJOR.MINOR.PATCH

例：
- `2.0.00`
- `2.1.03`

---

## 各番号の意味

### MAJOR（破壊的変更）

以下に該当する変更が行われた場合、MAJOR番号をインクリメントする。

- Kernel / Constitution の変更
- 非介入・非操作・選択可能性・境界防衛など  
  **HASの根本原則の定義変更**
- 既存ドキュメントの前提が成立しなくなる変更

**例**
- `1.x.xx` → `2.0.00`

---

### MINOR（構造的変更）

以下に該当する変更が行われた場合、MINOR番号をインクリメントする。

- 文書体系の再編（分離・統合・役割変更）
- Manifesto / Principles / Pitfalls などの新設・再定義
- 判断構造や運用導線に影響するが、Kernelは変更しないもの

**例**
- `2.0.00` → `2.1.00`

---

### PATCH（非破壊的修正）

以下に該当する変更が行われた場合、PATCH番号をインクリメントする。

- 文言の修正・明確化
- 翻訳・表現調整
- 誤記修正
- 誤解防止のための言い換え

**例**
- `2.1.00` → `2.1.04`

---

## 採番ルールの原則

- **複数の変更が含まれる場合は、最も影響の大きいレベルを採用する**
- MAJOR または MINOR が更新された場合、PATCH は `00` にリセットする
- バージョン番号は恣意的につけてはならない
- 変更理由は、対応する ADR に必ず記録する

---

## ADR との関係

- すべての MAJOR / MINOR 変更は ADR を伴う
- PATCH レベルの変更は、ADR を省略してもよい
- バージョン番号は **決定結果**であり、  
  正当性は ADR によって担保される

---

## 適用範囲

本ルールは、以下を含むすべての HAS 中核文書に適用される。

- Manifesto
- Kernel / Constitution
- Principles
- Facilitator Pitfalls
- Failure Modes
- Governance Documents

---

## 例：最近の変更の適用

- Kernel v2.0 確定  
  → `2.0.00`
- Manifesto再定義、Principles新設  
  → `2.1.00`
- 翻訳・表現調整  
  → `2.1.03`

---

## 補足

HASのバージョン番号は、  
完成度・優劣・成熟度を示すものではない。

**それは「設計上の前提がどこにあるか」を示す座標である。**

---

<!-- DOCCTRL:START -->
## Document Control
- **Repo Version:** v2.0.00-5-gcb38e58d-dirty
- **Last Modified:** 2025-12-17
- **Commit:** a3f37c6
- **Author:** Takeshi Kakeda
<!-- DOCCTRL:END -->