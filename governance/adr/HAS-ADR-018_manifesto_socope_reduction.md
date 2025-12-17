# ADR-031: Manifestoを「守るもの」に特化し、説明要素を分離する

## Status
Accepted

## Context
HASの文書体系が拡張される中で、Manifestoに以下の要素が混在していた。

- 守るべき価値の宣言
- 調律（Attunement）の説明
- 在り方・実践姿勢（Being Principles）

これにより、Manifestoが「宣言」なのか「説明書」なのかが曖昧になり、
読み手に過剰な理解要求や誤読リスクを生んでいた。

## Problem
Manifestoは何を担うべきか。
説明や実践指針をどこまで含めるべきか。

## Forces
- Manifestoは対外的な入口文書である
- HASは思想運動ではなく、判断体系である
- 説明過多は宣言の力を弱める
- 一方で、ConceptやPrinciplesは別途必要

## Decision
Manifestoは以下に限定する。

- HASが**何を最優先で守る体系か**
- 判断の最上位に置かれる価値の宣言

以下の要素はManifestoから除外する。

- Why Attunement（調律の説明）
- Being Principles（在り方・姿勢）

これらは、それぞれConceptおよびPrinciples文書に委譲する。

## Rationale
- 宣言は説明しない方が強い
- 「守るもの」に絞ることで、誤解と摩擦を減らせる
- 読み手が自分の位置取りをしやすくなる

## Pros & Cons
- \+ Manifestoが静かで引き締まる  
- \+ 対外公開に耐える  
- \+ 文書体系の役割分担が明確になる  

- − Manifesto単体ではAttunementの定義が分からない（ただしConceptへの導線で補完可能）

## Consequences
- Manifestoは00_manifesto.mdとして固定される
- 説明責務はConceptに集約される
- HASは「守る条件の体系」として認識されやすくなる

## Version
Decision: 1.0.0  
Code: HAS-docs v3.x

## Date
2025-12-16