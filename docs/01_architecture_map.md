# HAS Architecture Map
**Human Attunement System: 全体設計図（Map）**

> **"State over Theory. / 正しさより、状態を。"**  
> HASは、合意形成ツールでも、意思決定フレームでもない。  
> **人間の状態（State）を整え、選択が引き受けられる条件を作るための循環設計**である。

---

## 0. このMapの役割
この文書は、HASの「何がどこにあるか」を示す地図である。

HASには2種類の成果物がある：
- **読むための文章（住ませる）**：理解と納得を育てる
- **現場で使う道具（戻る）**：迷った瞬間に手を戻す

どちらも必要で、競合しない。

---

## 1. HASの核：2つのサイクル

HASの中核は、次の2サイクルからなる。

### 1.1 Attunement Cycle（調律サイクル：会議中に起きる）
P01〜P04で、場の状態を整え、選択が引き受けられるところまで進む。

- **P01 Place（置く）**：感情が置ける
- **P02 Distinguish（見分ける）**：FearとWantを区別する
- **P03 Hold（守る）**：沈黙を壊さない
- **P04 Own（引き受ける）**：「私が引き受ける」が生まれる

このサイクルは「正しい結論」を作らない。  
**引き受け可能な次の一歩**を生む。

### 1.2 Learning Cycle（学習サイクル：実践を育てる）
Attunement Levels（Level 0〜4）で、実践の成熟を支える。

- **Level 0（観察）**を基底（Base）として、いつでも戻れる
- **戻り（Recovery by Design）**を安全機構として持つ
- 熟練とは「高みに留まる」ではなく「適切に戻れる」

重要なのは「正しく使う」ことではなく、  
**場を壊さずに、少しずつ慣れていくこと**である。

---

## 2. HASの設計思想：OSではなくTS
HASは「組織を操作するOS」ではない。  
**場の状態に介入するTS（Tuning System）**である。

- OS的：ルール、手順、役割、管理、最適化
- TS的：状態、呼吸、間、揺れ、沈黙、引き受け

HASが守るのは「正しさ」ではなく、**人間の生理と関係性の破壊を避けること**。

---

## 3. HASを支える3層モデル（Layer Model）

### Layer A: Philosophy（思想）
「なぜそれをするのか」を固定する層。ブレない基準。

- Manifesto（価値・判断基準）
- OS vs TS（世界観）

### Layer B: Constraints（制約条件）
「これが守れない限り使うな」という安全制約の層。

- Facilitator Principles（存在論的原則・戒律）

### Layer C: Practice（実践）
現場で起きるプロセスの層。

- Patterns P01〜P04（調律サイクル）
- Quick Reference（現場の栞）
- Attunement Levels（学習・成熟の地図）

> **順番が逆になると壊れる。**  
> 道具（Quick Reference）だけが独り歩きすると、操作に堕ちる。  
> 文章（Patterns）だけが残ると、机上に浮く。

---

## 4. 会議の中で何が起きているか（状態遷移の地図）

HASは「議題の進行」ではなく「状態の遷移」を扱う。

典型的な崩壊はこの順で起きる：
1. **Must（〜すべき）**が立ち上がる
2. **Fear（恐れ）**が駆動する
3. **Armor（防御）**が場を固める
4. **Decisions without Ownership（引き受けのない決定）**が残る

HASは逆向きに戻す：
- Armorを脱がせるのではない  
- **Armorが不要になる状態**を作る

---

## 5. Recovery by Design（戻りの設計）
HASは「失敗しない設計」ではない。  
**壊れたときに戻れる設計**である。

- 乱れを検知したら、進むより先に **止める**
- 一つ前、またはP01へ **戻る**
- 何もしない（Level 0）へ **退避する**

戻れないことが唯一の危険。

---

## 6. ドキュメント配置（このMapが指すもの）

推奨フォルダ構造：

```text
docs/HAS/
├── 00_architecture_map.md            # [Map] この設計図
├── 00_manifesto.md                   # [Philosophy] 価値・憲法
├── 01_concept_os_vs_ts.md            # [Concept] OSではなくTS
├── 03_facilitator_principles.md      # [Constraints] 前提条件・戒律
├── 04_attunement_levels.md           # [Learning] 慣れの段階（Learning Path）
├── patterns/
│   ├── P01_place_for_feelings.md
│   ├── P02_distinguishing_wishes.md
│   ├── P03_holding_silence.md
│   └── P04_choosing_ownership.md
└── 99_quick_reference.md             # [Tool] 会議中の栞