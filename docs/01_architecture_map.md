# HAS Architecture Map
**Human Attunement System: 全体設計図（Map）**

> **State over Theory. / 正しさより、状態を。** > HASはフレームワークでもメソッドでもない。  
> **人間の状態（State）が壊れ始めたときに、選択が引き受けられなくなる連鎖を遮断するためのセーフティーシステム**である。

---

## 0. このMapの役割
この文書は **HASの現在地を見失わないための地図** である。

- 理解を深めるための文書
- 現場で迷ったときに戻るための基準

両者は役割が異なり、上下関係はない。

---

## 1. HASの核：2つのサイクル

### 1.1 Attunement Cycle（調律サイクル｜会議中）

状態を整え、**引き受け可能な選択**が生まれるまでの流れ。

- **P01 Place（置く）** → [P01_acceptance_of_emotion.md](../resources/patterns/state/P01_acceptance_of_emotion.md)

- **P02 Distinguish（見分ける）** → [P02_differentiation_of_emotion.md](../resources/patterns/state/P02_differentiation_of_emotion.md)

- **P03 Hold（守る）** → [P03_fullness_of_silence.md](../resources/patterns/state/P03_fullness_of_silence.md)

- **P04 Own（引き受ける）** → [P04_establishment_of_ownership.md](../resources/patterns/state/P04_establishment_of_ownership.md)

このサイクルは「正解」を作らない。  
**誰かが「私が引き受ける」と言える状態**を作る。

---

### 1.2 Learning Cycle（学習サイクル｜実践の成熟）

HASを「うまく使う」ためではなく、  
**壊さずに戻れるようになるための学習構造**。

- Attunement Levels  
  → [03_attunement_levels.md](./03_attunement_levels.md)

- Level 0（観察）を常に退避点として保持  
- 熟練とは「高みに留まること」ではなく「適切に戻れること」

---

## 2. HASの設計思想：OSではなくTS

HASは組織を制御する **OS** ではない。  
場の状態を微調整する **TS（Tuning System）** である。

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
「これが守れないなら使うな」という境界。

- Facilitator Principles  
  → [04_facilitator_principles.md](./04_facilitator_principles.md)

- Governance / ADR  
  → [governance/adr/](../governance/adr/)

---

### Layer C: Practice（実践）
現場で起きることすべて。

- State Patterns（P01–P04）  
  → [resources/patterns/state/](../resources/patterns/state/)

- Techniques（任意・非必須）  
  → [resources/patterns/techniques/](../resources/patterns/techniques/)

- Quick Reference  
  → [resources/quick_reference.md](../resources/quick_reference.md)

> **注意:** > Practice だけが独立すると、HASは「操作」になる。

---

## 4. 状態遷移の基本構造（PFA）

HASが扱うのは「議論の失敗」ではなく、  
**場の力学がある順序で固着していく現象**である。

### 4.1 PFA要素の定義

* **Pressure（圧力）**: 場を「行為」へと急き立てる不可視の引力。（例：早く決めたい、沈黙への耐え難さ）
* **Fear（恐れ）**: 選択に伴う根源的な震え。（例：孤立、不可逆、役割の融解）
* **Armor（防衛）**: 恐れから距離を取るための自動的な振る舞い。（例：主語の隠蔽、知性化、課題化）

---

## 5. 二つの遷移モデル（The Two Flows）

HASは、調律の有無によって分岐する二つの対照的な流れを前提とする。

### 5.1 調律なき自然落下（Unattuned Flow）
調律が介在しない場合、関係性は必然的にこの順序で硬直化する。これは失敗ではなく、構造的な帰結である。

1.  **Pressureが立ち上がる**: 曖昧さに耐えられず、行為（発言・決定）への内圧が高まる。
2.  **Fearが駆動される**: 孤立や不可逆への恐れから、視野が狭窄し、短期的な安心を求める。
3.  **Armorが自動展開する**: 正論化、一般化、他者依存によって、恐れから距離を取る振る舞いが固定化する。
4.  **Ownershipなき行為**: 「私が引き受ける」という感覚が欠落したまま、決定や発言がなされる。
5.  **関係性の損傷**: 結果責任の所在が曖昧になり、不信や断絶が生まれ、次のPressureが強化される。

### 5.2 調律による遮断（Attuned Interruption）
HASは、上記の自然落下を「止める」ためにのみ機能する。

* **Pressureを下げる**: 進めない、決めない、沈黙を埋めない。
* **Fearに触らない**: 説得しない、安心させない、理由を聞かない。
* **Armorを書かせない**: 表現させない、整理させない、構造化させない。

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
- 一段階戻る、またはP01へ戻る
- 何もしない（Level 0）へ退避する

戻れないことだけが危険。

---

## 8. 現在のディレクトリ構造（正）

```text
HAS/
├── core/
│   └── HAS_v2.0_Final.md              # 核となる最終仕様
├── docs/
│   ├── 00_manifesto.md
│   ├── 01_architecture_map.md         # ← このファイル
│   ├── 02_concept.md
│   ├── 03_attunement_levels.md
│   ├── 04_facilitator_principles.md
│   ├── 05_faq.md
│   └── 06_glossary.md
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