# ADR-019: 判断を支える「正の原則（Principles）」を独立文書として新設する

## Status
Accepted

## Context
HASには以下の文書が存在していた。

- Constitution / Kernel（絶対条件）
- Facilitator Pitfalls（負のガードレール）
- Failure Modes / Contraindications（危険領域）

しかし、
「判断が割れたとき、どちらを優先するか」
を支える**正の判断軸**が存在しなかった。

## Problem
Pitfallsだけでは、
「間違ってはいないが、正しいとも言えない」状況を判断できない。
実践者が迷ったときの優先軸が欠落している。

## Forces
- 原則は倫理規範になってはいけない
- 行動指示ではなく、優先順位である必要がある
- Pitfallsと対をなす構造が望ましい

## Decision
Being Principlesを再定義し、
以下の性質を持つ文書として独立させる。

- 行動規範ではない
- 理想像ではない
- 強制される姿勢ではない
- **判断が割れたときの優先原則**

この文書を `03_principles.md` として新設する。

## Rationale
- 正の原則がないと、HASは萎縮か暴走に傾く
- PrinciplesとPitfallsが対になることで、判断が安定する
- 実践者のための「判断の地図」が必要

## Pros & Cons
- \+ 判断の迷いが減る
- \+ Pitfallsの使い所が明確になる  
- \+ HASが「使える体系」になる  

- − 文書が一つ増える  
（ただし導線整理で許容範囲）

## Consequences
- Manifesto / Principles / Pitfalls の三層構造が成立
- HASは宣言・判断・制止を分離した体系になる
- 実践者の自律性が高まる

## Version
Decision: 1.0.0  
Code: HAS-docs v3.x

## Date
2025-12-16