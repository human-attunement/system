# HAS 全体設計図

HAS Architecture Map
**Human Attunement System: 全体設計図（Map）**

> **State over Theory. / 正しさより、状態を。**

HASはフレームワークでもメソッドでもない。  
**人間の状態（State）が壊れ始めたときに、選択が引き受けられなくなる連鎖を遮断するためのセーフティーシステム**である。

---

## 0. このMapの役割
この文書は **HASの現在地を、実践者が見失わないための地図** である。

- 理解を深めるための文書
- 現場で迷ったときに戻るための基準

両者は役割が異なり、上下関係はない。

---

## 1. HASの核：2つのサイクル

### 1.1 Attunement Cycle（調律サイクル｜会議中）

状態を整え、**引き受け可能な選択**が生まれるまでの流れ。

- **P01 置かれた感情（Place）** → [P01_placed_emotion.md](../resources/patterns/state/P01_placed_emotion.md)

- **P02 識別された感情（Distinguish）** → [P02_differentiated_emotion.md](../resources/patterns/state/P02_differentiated_emotion.md)

- **P03 沈黙の充満（Hold）** → [P03_fullness_of_silence.md](../resources/patterns/state/P03_fullness_of_silence.md)

- **P04 引受の成立（Own）** → [P04_establishment_of_ownership.md](../resources/patterns/state/P04_establishment_of_ownership.md)

このサイクルは「正解」を作らない。  
**誰かが「私が引き受ける」と言える状態**を作る。

---

### 1.2 位置の識別（Position Identification）

HASを「うまく使う」ためではなく、  
**いま自分がどこにいるかを誤解しないための地図**。

4つの位置：
- **観察（Observation）**: 判断が立ち上がっていない
- **判断保留（Suspended Judgment）**: 判断を宙吊りにしている
- **仮動（けどう / Tentative Action）**: 試行しているが完遂を目的化していない
- **乱れ（Disruption）**: 継続不能、戻りたい

詳細：[Attunement Map](./04_attunement_map.md)

#### HAS外条件
以下の場合、HASの外にいる：
- 結論を確定している
- 完遂を目的化している
- 介入を固定している（操作モードに入っている）

HAS外にいる場合、状態判定より先に**観察へ戻る判断**が最初の実践となる。

---

## 2. HASの設計思想：OSではなくTS

HASは組織を制御する **OS** ではない。  
場の状態を微調整し続ける **TS（Tuning System）** である。

- 理念と位置づけ  
  → [02_concept.md](./02_concept.md)

HASは最適化しない。  
**破壊を起こさないこと**だけを守る。

---

## 3. 3層構造（Layer Model）

HASは明確な層構造を持つ。  
順序が逆転すると必ず壊れる。

### Layer A: Philosophy（思想）
「なぜそれをやるのか」を固定する層。

- Manifesto  
  → [00_manifesto.md](./00_manifesto.md)

---

### Layer B: Constraints（制約・安全条件）

「これが守れないと、HASはうまく機能しない」という安全境界。

#### B-1: 判断の優先軸（正の原則）
判断が割れたときに、どちらを優先するかを定める。

- Principles  
  → [03_principle.md](./03_principle.md)

#### B-2: 壊れやすいポイント（負のガードレール）
陥りやすい構造と、事故の予防。

- Facilitator Pitfalls  
  → [05_facilitator_pitfalls.md](./05_facilitator_pitfalls.md)

- Failure Modes  
  → [08_failure_modes.md](./08_failure_modes.md)

#### B-3: 位置の識別
自分がどこにいるかを誤解しないための地図。

- Attunement Map  
  → [04_attunement_map.md](./04_attunement_map.md)

> **重要:**  
> Principles（正）と Pitfalls（負）が対をなして、初めて判断が安定する。

---

### Layer C: Practice（実践）

現場で起きることすべて。

- State Patterns（P01–P04）  
  → [resources/patterns/state/](../resources/patterns/state/)

- Techniques（任意・非必須）  
  → [resources/patterns/techniques/](../resources/patterns/techniques/)

- Quick Reference  
  → [resources/quick_reference.md](../resources/quick_reference.md)

> **重要:**
> Practice だけが独立すると、HASは「操作」になる。

---

## 3.5 ディレクトリ構造の意図

HASは4つのディレクトリに分離されている。
```
HAS/
├── core/           # 核（Kernel・Constitution）
├── docs/           # 思想・概念・制約・安全仕様
├── governance/     # 運用プロトコル・ADR
└── resources/      # パタン・参考資料・クイック参照
```

**設計意図:**
- `core/` は変更不可（Sealed）
- `docs/` は慎重に更新される思想・仕様層
- `governance/` は運用ルール（HAS本体の外）
- `resources/` は増殖・派生を許容する実践層

**詳細なファイル配置:**  
最新の構造は [GitHubリポジトリ](https://github.com/human-attunement/system) を参照してください。  
このMapは「構造の意図」を示すものであり、ファイル一覧の正本ではありません。

---

## 4. 状態遷移の基本構造（PFA）

HASが扱うのは「議論の失敗」ではなく、  
**場の力学がある順序で固着していく現象**である。

### 4.1 PFA要素の定義

* **Pressure（圧力）**: 場を「行為」へと急き立てる不可視の引力。（例：早く決めたい、沈黙への耐え難さ）
* **Fear（恐れ）**: 選択に伴う根源的な震え。（例：孤立、不可逆、役割の融解）
* **Armor（防衛）**: 恐れから距離を取るための自動的な振る舞い。（例：主語の隠蔽、知性化、課題化）

**※ HASにおけるArmorの扱い:**  
HASは、すでに展開されたArmorを解放・修正しない。  
ただし、それを判断・進行・正当化の根拠として扱わない。  
Armorが出ていても、進めない／決めない／評価しないことはできる。

---

## 5. 二つの遷移モデル（The Two Flows）

HASは、調律の有無によって分岐する二つの対照的な流れを前提とする。

### 5.1 調律なき自然落下（Unattuned Flow）

調律が介在しない場合、関係性は必然的にこの順序で硬直化する。これは失敗ではなく、構造的な帰結である。

1.  **Pressureが立ち上がる**: 曖昧さに耐えられず、行為（発言・決定）への内圧が高まる。
2.  **Fearが駆動される**: 孤立や不可逆への恐れから、視野が狭窄し、短期的な安心を求める。
3.  **Armorが自動展開する**: 正論化、一般化、他者依存によって、恐れから距離を取る振る舞いが固定化する。
4.  **Ownershipなき行為が実行される**: 「私が引き受ける」という感覚が欠落したまま、決定や発言がなされる。
5.  **関係性が損傷する**: 結果責任の所在が曖昧になり、不信や断絶が生まれ、次のPressureが強化される。

### 5.2 調律による遮断（Attuned Interruption）

HASは、上記の自然落下を「止める」ためにのみ機能する。

* **Pressureを下げる**: 進めない、決めない、沈黙を埋めない。
* **Fearに触らない**: 説得しない、安心させない、理由を聞かない。
* **Armorを展開させない**: 表現させない、整理させない、構造化させない。

結果として、状態は前進せず、P01（置く）へと**戻る**。
HASは「良い結果」を生むためではなく、「悪い連鎖」を断ち切るためのセーフティーシステムである。

---

## 6. 構造の再帰性（Recursive Structure）

HASが扱う「選択可能性の消失」の力学（PFA）は、個人の内面から集団まで、スケールを超えて再帰的に現れる。

以下に、同一の構造が異なるスケールでどのように観測されるかを示す。

### 6.1 個人のスケール (Individual Scale)

内面で起きる、思考と感情の硬直化。

* **Pressure:** 「正解を出さなければ」「間違えてはいけない」という内的な焦燥感。
* **Fear:** 自分で選ぶことへの根源的な恐れ。選択に伴う孤立や責任への回避。
* **Armor:** 思考の知性化、感情の抑圧、他者への依存（条件付け）。
* **結果:** 自分の願い（Want）が分からなくなり、他者の期待や義務（Must）を自分の意志だと錯覚する。

### 6.2 関係・集団のスケール (Relational / Collective Scale)

場の空気として共有される、相互作用の硬直化。

* **Pressure:** 「空気を読まなければ」「早く合意しなければ」という同調圧力。
* **Fear:** 異論を唱えることによる排除や、場の崩壊への恐れ。
* **Armor:** 主語の隠蔽（「私たちは」）、一般論への逃避、沈黙の回避。
* **結果:** 「みんなで決めた」という形式だけが残り、誰も責任を引き受けていない決定がなされる。

---

## 7. Recovery by Design（戻りの設計）

HASは「失敗しない設計」ではない。  
**壊れたときに戻れる設計**である。

- 乱れを検知したら進まない
- 一段階戻る、または観察へ戻る
- 何もしない（観察）へ退避する

戻れないことだけが危険。

---

## 8. Supporting: Governance & Design History

HASの思想・実践を支える、運用と設計判断の記録。

### Governance（統治・運用）
HASを壊さないための手続き。

- Emergency Stop Protocol  
  → [governance/protocols/emergency_stop.md](../governance/protocols/emergency_stop.md)
  
- Steward Judgment Protocol  
  → [governance/protocols/steward_judgment.md](../governance/protocols/steward_judgment.md)

- Maintenance Protocol  
  → [governance/protocols/maintainance.md](../governance/protocols/maintainance.md)

- Public Relations Protocol  
  → [governance/protocols/public_relations.md](../governance/protocols/public_relations.md)

### Design History（設計判断の記録）
HASがなぜ現在の形になったかを記録する。

- Architecture Decision Records（ADR）  
  → [governance/adr/](../governance/adr/)

**重要:**  
これらは HAS Kernel の外部に位置する。  
HAS 本体は「Doing」を定義しないが、運用には手続きが必要である。  
この分離により、思想の純度と運用の安全性が両立する。

---

## 関連文書

### 思想と設計
- [Manifesto](./00_manifesto.md) — HASの価値と姿勢
- [Concept](./02_concept.md) — なぜ調律なのか

### 制約と判断
- [Principles](./03_principle.md) — 判断の優先軸
- [Attunement Map](./04_attunement_map.md) — 位置の識別
- [Facilitator Pitfalls](./05_facilitator_pitfalls.md) — 陥りやすい落とし穴

### 実践と回復
- [Patterns P01–P04](../resources/patterns/state/) — 状態遷移の構造
- [Failure Modes](./08_failure_modes.md) — 典型的な事故パターン
- [Quick Reference](../resources/quick_reference.md) — 現場即参照用

---

<!-- DOCCTRL:START -->
## Document Control
- **Repo Version:** v2.1.01-2-g2185b8b0-dirty
- **Last Modified:** 2025-12-17
- **Commit:** 2dfb77d
- **Author:** Takeshi Kakeda
<!-- DOCCTRL:END -->