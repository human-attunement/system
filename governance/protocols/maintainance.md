# HAS Maintenance Protocol
**HAS保守プロトコル：権威なき守護**

## 1. Role Definition: Stewards (世話人)
HASには「リーダー」も「家元」も存在しない。
存在するのは、カーネル（v2.0 Final）の整合性を監視する**「世話人 (Stewards)」**のみである。

* **機能:** HASの定義（Constitution / Contraindications）に基づき、誤用や改変を照合する。
* **非人格性:** Stewardは個人の思想や解釈を語らない。常に「ドキュメントとの照合結果」のみを語る。

---

## 2. Negative Authority (拒否権の限定)
Stewardsが持つ権限は、以下の「否定」に限定される。肯定や創造の権限は持たない。

* ❌ **No Creation:** 新しい概念や原理を追加することはできない。
* ❌ **No Evangelism:** 「これが正しいHASだ」と推奨・布教することはできない。
* ✅ **Veto (拒否):** 「それは定義上、HASではない」と判定することだけができる。

> **Intervention Threshold (介入の閾値):**
> Stewardsは、HASの名が用いられている実践において、**Constitution または Contraindications に明確に違反する場合にのみ**発言する。
> 解釈の揺れやグレーゾーンにおいては、沈黙を守らなければならない。

> **Forking Rule:**
> HASが拡張される時、それは本流のアップデートではなく、誰かによる**「派生（Fork）」**として行われるべきである。Stewardsは本流（v2.0）を凍結し続けるために存在する。

---

## 3. Structure (分散と流動)
* **人数:** 3〜5名（合議を維持するため）。
  - 奇数は「多数決」のためではない
  - 不在・離脱・一時停止が発生しても、合議が成立する冗長性を確保するため
  - Steward判定は投票ではなく、合議と文書照合による
* **任期:** 固定しないが、永続もしない。役割は流動的に交代する。
* **Recursive Application (再帰的適用):**
    Steward自身もHASの適用対象であり、特権を持たない。
    自らの判定・実践がHASに反すると指摘された場合、役割の交代が検討される。
    交代手続きは、`steward_judgment.md` Section 5.3 に従う。

---

### 3.1 Stewardの交代手続き

Stewardの役割は固定ではなく、流動的に交代される。

#### 交代の発動条件
以下のいずれかが確認された場合、Steward間の合議により交代が検討される:

1. **透明性違反:** 判定の記録・公開を履行していない
2. **恣意的判定:** 文書根拠なく、解釈のみで判定を繰り返す
3. **権威化:** 「私の判断が最終」という態度で合議を拒否する
4. **再帰的監査の拒否:** 自己点検・相互監査を受け入れない

#### 合議と決定
- 他のStewardが問題を指摘する
- 当該Stewardに弁明の機会を与える
- 合議が不調なら、ケースを匿名公開し判断を保留
- 保留中、当該Stewardの判定権限は一時停止される

#### 新Stewardの選出
- 任期・資格・試験は設けない
- 条件: 「文書を読める」「恣意的判断をしない」ことのみ
- Steward自身も、常にHASの適用対象である（再帰的）

#### 記録
- 交代の理由・経緯は記録され、公開される（匿名化）
- 過去の交代事例は、判断基準の改善材料とする

---

## 4. Judgment Criteria (判断の淵源)
判定の根拠は、常に以下の静的ドキュメントにのみ求められる。

1.  **HAS v2.0 Final (Core Definition)**
2.  **Constitution (3 Principles)**
3.  **Contraindications (Red Zones)**
4.  **ADR-001〜007 (Rationale)**

「昔、提唱者がこう言っていた」という口伝や、「私の感覚では」という主観は、一切の効力を持たない。

---

## Related Documents
- [Steward Judgment Protocol](./steward_judgment.md)
- [HAS Kernel](../../core/HAS_v2.0_Final.md)
- [ADRs](../adr/)

---

<!-- DOCCTRL:START -->
## Document Control
- **Repo Version:** v2.3.1-5-g40ec3211-dirty
- **Last Modified:** 2025-12-24
- **Commit:** 442b22f
- **Author:** Takeshi Kakeda
<!-- DOCCTRL:END -->