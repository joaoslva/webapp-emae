# Domain model — extracted from the legacy artefacts

Derived 2026-09-23 by reading `examples/Livro_MU.xlsx`, `examples/protótipo_v2.xlsm`
(including its VBA) and `examples/Avaliação das Medidas_alunosmedidasuniversais.docx`.

## Provenance — read this first

The three artefacts do **not** carry equal authority:

| Artefact | What it is | Weight |
|---|---|---|
| `Avaliação das Medidas…docx` | the official per-student report form | **Binding** — the legal deliverable |
| `Livro_MU.xlsx` | what the school actually used | **Requirement** — established practice |
| `protótipo_v2.xlsm` | João's own earlier test run | **Proposal only** — prior design thinking, not school practice |

So the prototype's `Tabelas` aggregation spec, its ano/turma dimensions, its extended
Pré-Escolar disciplina list and its password scheme are all **João's proposals**. They are
mostly good and worth carrying forward, but none of them is a requirement and none needs
the school's sign-off to change.

## The central fact

Everything reduces to one grain:

```
(aluno, medida, disciplina, período) → eficácia
```

In `Livro_MU.xlsx` sheet `5º A` this is laid out as one sheet per turma, a 5-row block per
student (one row per medida), and one column per disciplina. The cell value is the efficacy
rating. `protótipo_v2.xlsm` generalises the same grid via a `Template` sheet cloned per
turma by VBA from `Folha Controlo`.

**`período` is not in the spreadsheets at all** — each workbook implicitly *is* one period.
The app must make it an explicit dimension; this is the single biggest structural change
from the legacy model.

## Controlled vocabularies

**Eficácia** (ordinal, 3 levels + 1 sentinel):

| Value | Meaning |
|---|---|
| `Não mobilizada` | measure not applied — sentinel, **not** a zero on the scale |
| `Nada eficaz` | 1 |
| `Pouco eficaz` | 2 |
| `Eficaz` | 3 |

`Não mobilizada` must stay distinct from the ordinal levels. It is the default for every
cell, so most of the grid is sparse in practice — the app should store applied measures
only and treat absence as `Não mobilizada`.

**Medidas** as the school currently lists them (5, in `Tabelas` and every turma sheet):

1. Diferenciação Pedagógica
2. Acomodações Curriculares
3. Enriquecimento curricular
4. Promoção do comportamento pró-social *(incluir também alunos …)*
5. Adequações ao processo de avaliação

**Ano de escolaridade:** `Pré-Escolar`, `1º`–`12º ano`.
**Turma:** single letter `A`–`Z`, plus `N/A`.
**Disciplina:** ~55 entries, including five `Pré-Escolar: …` áreas de conteúdo.
The prototype's list is a superset of `Livro_MU`'s.

## Aggregations (from `Tabelas` — João's proposal, not school practice)

The efficacy roll-up uses the **mode — "valor mais frequente"**, not a mean. Correct for an
ordinal scale, and it must be preserved. Tie-breaking is unspecified in the legacy model and
needs a decision.

**Per disciplina**, for each medida: is it applied? · nº de alunos com a medida · eficácia
(modal) · % de alunos com esta medida face ao total.

**Per aluno**, for each medida: aplicada? · eficácia (modal) · disciplinas em que é aplicada.

**Per turma** (from `Template`): nº de disciplinas na turma · nº de disciplinas com ≥1 medida
aplicada · nº de alunos na turma · nº de alunos com ≥1 medida aplicada · disciplina com o
maior número de medidas aplicadas · contagem de alunos por nível de eficácia.

## Free-text fields (per aluno, per período)

- `Fundamentação`
- `Propostas para o próximo período / ano letivo`
- `Síntese da evolução do aluno` — **3rd period only**

## The output document

`Avaliação das Medidas_alunosmedidasuniversais.docx` is **per student**, and is the actual
legal deliverable. Header: Nome · Ano de Escolaridade · Grupo/Turma · Estabelecimento de
Ensino. Body sections:

1. **Medidas Universais (Art.º 8.º)**
2. **Adaptações ao Processo de Avaliação (Art.º 28.º)**

…then Fundamentação, Propostas, and two signature blocks: *Responsável pela avaliação /
Professor Titular / Diretor de Turma*, and *Tomada de conhecimento / Encarregado de Educação*,
each with a date.

Signature + acknowledgement means the report is a **point-in-time record**. Once issued it
must be immutable and reproducible — later edits to the underlying data cannot silently
change an already-signed document.

## Discrepancies and open questions

1. **Art. 8 vs Art. 28 conflict.** The Word report treats *Adaptações ao Processo de
   Avaliação* as **Art. 28**, a section separate from the Art. 8 universal measures. The
   Excel lists *Adequações ao processo de avaliação* as the 5th peer of the universal
   measures. These disagree. Consequence: `medida → artigo` is a real attribute, not
   cosmetic, and the 5-item list is not simply "the Art. 8 measures".
2. **A possibly missing Art. 8 measure.** DL 54/2018 Art. 8 appears to include *intervenção
   com foco académico ou comportamental em pequenos grupos*, which is absent from the
   school's list — where *Adequações ao processo de avaliação* sits instead. Verify against
   the statute text and ask whether the school genuinely does not use it. Do not assume the
   school's list is complete.
3. **Tie-breaking for the modal efficacy** is undefined in the legacy model.
4. **Measure applicability granularity.** `Tabelas` asks "a medida é aplicada?" at both the
   aluno level and the aluno×disciplina level. Needs to be settled: is a measure assigned to
   a student and then rated per discipline, or assigned per discipline directly?

## Access model sketched in the prototype (João's, not the school's)

`protótipo_v2.xlsm` holds a `Password DB` worksheet with **plaintext passwords in cells** —
one per turma sheet (`1º A` → `t779de`), plus separate `Admin` and `Estatísticas` passwords,
generated by VBA.

This was João's own sketch, so it carries no institutional weight — but **the role model it
implies is sound** and is worth keeping: a teacher reaches only their own turma; EMAEI/admin
sees everything; statistics are gated separately from data entry.

## Configurable measure catalogue (decided 2026-09-23)

Measures become admin-configurable reference data rather than a hardcoded list, with
collection pages grouped by artigo. Constraints agreed:

- **Seeded from the statute, not invented.** Ship the DL 54/2018 catalogue (Arts. 8, 9, 10,
  28). Admins enable, disable, reorder and relabel; genuinely custom entries are flagged as
  such so statutory drift stays visible.
- **Effective-dated, never hard-deleted.** Disabling a measure mid-year must not orphan
  existing records, and a report signed in an earlier period must still render with the
  catalogue that was in force when it was signed.
- **Each measure declares a `rating_scope`: `per_disciplina` or `per_aluno`.** The articles
  do not share one shape — Art. 8 rates per discipline, but Art. 9 mixes both (*adaptações
  curriculares não significativas* is per-discipline; *apoio psicopedagógico* and *apoio
  tutorial* are per-student). The collection page renders from the scope. **Confirm with the
  EMAEI contact** — this is the assumption most likely to be wrong.
- **Art. 28 is probably cross-cutting, not a peer tier.** The Word report lists it alongside
  Art. 8 *for the same student*, so adaptations sit across whatever tier a student is on.

## Prior schema attempt (recovered before deletion)

`example-app/database/seeder.sql` held a hand-written Postgres schema from João's earlier
attempt at this project. The directory was deleted on 2026-09-28; the file remains in git
history at commit `8eee675` if ever needed. Two things in it are worth carrying forward.

**`MeasureAggregation` anticipated the artigo grouping.** The old schema had
`Measure.aggregation_id -> MeasureAggregation`, which is the same idea as the configurable
catalogue grouped by artigo, arrived at independently. Reasonable confirmation that grouping
measures under a parent category is the natural shape of this domain.

**Its `Efficiency` table could not actually record efficacy.** It was
`(measure_id, student_id)` and nothing else: no efficacy value, no disciplina, no período.
So the old model could record *that* a measure applied to a student, but never how well it
worked, in which subject, or when. This is precisely the gap the
`(aluno, medida, disciplina, período) -> eficácia` grain closes, and it is the clearest
evidence that the new grain is the right one.

Also present and now deliberately dropped: `SchoolDistrict`, `School`, `SchoolarYear` and
`School_SchoolarYear`, the multi-school ambition abandoned with monetization.
