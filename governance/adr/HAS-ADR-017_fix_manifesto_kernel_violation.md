# ADR-017: 旧ManifestoのKernel違反を是正し、整合する内容にリライトする

## Status
Accepted

## Context
旧版のHAS Manifestoには、HAS Kernel v2.0 Final の設計判断と
**意味的に矛盾・逸脱する記述**が含まれていた。

具体的には以下の点である。

- 調律（Attunement）を「促す」「導く」印象を与える表現
- 在り方（Being）や実践姿勢を、価値宣言として混在させた構造
- 「良い変化」「望ましい状態」を暗黙のゴールとして示唆する言い回し

これらは、Kernelが定義する以下の原則と衝突していた。

- 非介入（Non-intervention）
- 非操作（Non-manipulation）
- 選択可能性（Selectability）
- 境界防衛（Boundary Defense）

## Problem
ManifestoがKernelに違反している場合、
HAS全体の設計に以下の問題が生じる。

- 上位文書が下位設計を侵食する
- 実践者が「善意の介入」を正当化しやすくなる
- HASが「変化を起こす体系」と誤認される

Kernelと矛盾したManifestoを、
そのまま公開・維持してよいかが問われた。

## Forces
- KernelはHASにおける最上位の設計制約である
- ManifestoはKernelに従属すべき文書である
- 言語のニュアンスであっても、誤誘導は設計違反となる
- 旧Manifestoは歴史的経緯により、Kernel確定前の思想を含んでいた

## Decision
旧Manifestoをそのまま維持することはせず、
**Kernel v2.0 Final に完全整合する形で全面的にリライトする**。

リライトの方針は以下とした。

- 「何を起こすか」ではなく「何を守るか」に限定する
- Attunementを目的や価値として説明しない
- 在り方・姿勢・実践指針はManifestoから除外する
- 非介入・非操作・選択可能性と衝突する表現をすべて排除する

## Rationale
- Kernel違反は思想の問題ではなく、設計欠陥である
- 上位文書がKernelに違反すると、全体系が崩れる
- Manifestoは説明書ではなく、優先順位の宣言であるべき

Kernelに従属しないManifestoは、
HASを誤用可能な体系にしてしまう。

## Pros & Cons
- \+ ManifestoとKernelの意味的一貫性が回復する  
- \+ 実践者による自己正当化の余地が減る  
- \+ HASが「介入しない体系」であることが明確になる  

- − 旧Manifestoに共感していた一部読者には違和感が生じる可能性  
（ただし設計上の正当性を優先）

## Consequences
- 新Manifesto（v3.0）はKernelに完全従属する
- Manifestoは「守る条件の宣言」として固定される
- Attunementや在り方の説明責務はConcept / Principlesに委譲される
- HASは設計整合性を最優先する体系として明確化される

## Version
Decision: 1.0.0  
Code: HAS-docs v3.x

## Date
2025-12-16