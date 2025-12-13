# HAS Architecture Map
**Human Attunement System: 全体設計図（Map）**

> **State over Theory. / 正しさより、状態を。** > HASはフレームワークでもメソッドでもない。  
> **人間の状態（State）を壊さず、選択が引き受けられなくなる事態を防ぐための人間調律セーフティーシステム（Safety System）**である。
> 
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

### 典型的な崩壊の遷移

1. **Pressure（圧力）が立ち上がる** - 早く決めたい  
   - 進めなければならない  
   - 曖昧さに留まれない  
   場全体に、行為へと急き立てる引力が生じる。

2. **Fear（恐れ）が駆動される** - 孤立する恐れ  
   - 間違える恐れ  
   - 不可逆を引き受けることへの恐れ  
   個人の内側で、選択そのものへの震えが立ち上がる。

3. **Armor（防衛）が場に現れる** - 主語の隠蔽  
   - 正解探し  
   - 評価・知性化・条件付け  
   恐れから距離を取るための振る舞いが固定化する。

4. **Ownershipの欠落した決定が残る** - 「決まった」が「引き受けられていない」  
   - 実行段階で他責・停滞が生じる  

これは失敗ではなく、  
**調律されていない状態では必然的に起きる帰結**である。

---

### HASが行うこと

HASはこの流れを「正す」のではない。  
**圧力を下げ、恐れを刺激せず、防衛が不要になる状態へ戻す。**

- Armorを剥がさない  
- Fearを説得しない  
- Pressureを否定しない  

ただ、状態を一段階前へ戻す。  
必要なら、P01（置く）まで戻る。

HASは前に進めるための仕組みではない。  
**壊れないために、戻れるようにする設計である。**
- 防衛を壊さない  
- **防衛が不要になる状態を作る**

---

## 5. 構造の再帰性（Recursive Structure）

HASが扱う「選択可能性の消失」の力学（PFA）は、個人の内面から集団まで、スケールを超えて再帰的に現れる。

以下に、同一の構造が異なるスケールでどのように観測されるかを示す。

### 5.1 個人のスケール (Individual Scale)
内面で起きる、思考と感情の硬直化。

* **Pressure:** 「正解を出さなければ」「間違えてはいけない」という内的な焦燥感。
* **Fear:** 自分で選ぶことへの根源的な恐れ。選択に伴う孤立や責任への回避。
* **Armor:** 思考の知性化、感情の抑圧、他者への依存（条件付け）。
* **結果:** 自分の願い（Want）が分からなくなり、他者の期待や義務（Must）を自分の意志だと錯覚する。

### 5.2 関係・集団のスケール (Relational / Collective Scale)
場の空気として共有される、相互作用の硬直化。

* **Pressure:** 「空気を読まなければ」「早く合意しなければ」という同調圧力。
* **Fear:** 異論を唱えることによる排除や、場の崩壊への恐れ。
* **Armor:** 主語の隠蔽（「私たちは」）、一般論への逃避、沈黙の回避。
* **結果:** 「みんなで決めた」という形式だけが残り、誰も責任を引き受けていない決定がなされる。

---

## 6. Recovery by Design（戻りの設計）

HASは「失敗しない設計」ではない。  
**壊れたときに戻れる設計**である。

- 乱れを検知したら進まない
- 一段階戻る、またはP01へ戻る
- 何もしない（Level 0）へ退避する

戻れないことだけが危険。

---

## 7. 現在のディレクトリ構造（正）

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