# Legacy user stories

Recovered from the original `README.md` on 2026-09-28, which was a presentation document
written in Portuguese for the EMAE team during João's earlier attempt at this project. The
README itself was replaced; the requirements in it were worth keeping.

These are **prior intent, not commitments**. Several are now explicitly out of scope. They
are kept because they came from thinking about the real users, and because a few of them
anticipate decisions since arrived at independently.

## Roles as originally framed

- **Professores** fill in measure data for the turmas they teach, authenticate, and see
  notices about data they still owe.
- **Administradores** (the EMAEI working group) have full control: they create turmas with
  their students and disciplinas, see what teachers entered, and access statistics.

This matches the role model carried forward: teacher sees own turma, EMAEI and admin see
all, statistics gated separately.

## Teacher stories

| ID | Story | Status |
|---|---|---|
| US01 | Authenticate | In scope, Phase 4 |
| US02 | Fill in measure data for turmas I teach | In scope, the core of Phase 1 and 6 |
| US03 | Edit data I previously entered | In scope |
| US04 | Be told which of my students still have no measures recorded | Worth keeping, cheap and genuinely useful |
| US05 | A help page explaining how to use the application | Deferred, revisit after watching a teacher use it |

## Administrator stories

| ID | Story | Status |
|---|---|---|
| US11 | Authenticate | In scope, Phase 4 |
| US12 | Create turmas | In scope |
| US13 | Specify turma details such as the agrupamento it belongs to | Partly out of scope, single agrupamento now |
| US14 | Associate students with turmas | In scope |
| US15 | Associate disciplinas with turmas | In scope |
| US16 | Group data by ano letivo | In scope, and now also by período |
| US17 | Create, modify and delete teacher accounts | In scope, Phase 4 |
| US18 | Modify turma, student and disciplina data | In scope |
| US19 | Define the values teachers can assign to measure efficacy | Superseded: the efficacy scale is fixed and ordinal, but the *measure catalogue* is configurable, which is the more useful version of this |
| US20 | Statistics per disciplina | In scope as a plain table, Phase 6 |
| US21 | Statistics per aluno | In scope as a plain table |
| US22 | Statistics per medida | In scope as a plain table |
| US23 | Statistics per escola | Out of scope, single school |
| US24 | Statistics per agrupamento | Out of scope, single agrupamento |
| US25 | Statistics per ano escolar | In scope as a plain table |
| US26 | Preview the teacher's view to check the data looks right | Worth keeping, cheap and a real support need |
| US27 | Fill in data for my own students | In scope, EMAEI members also teach |

## Notes

US19 is the most interesting of these. The original instinct was that admins should control
the efficacy vocabulary. The current design fixes the efficacy scale, because it is ordinal
and its levels come from the school's established practice, but makes the **measure
catalogue** configurable instead. That is the same impulse aimed at the thing that actually
varies between schools.

US04 and US26 are both small, both were asked for by someone thinking about daily use, and
neither is in the current plan. Worth adding to Phase 6 once the grid works.

The original mockups referenced by that README are in `mockups/`, and the old database
diagram is in `imagens/`. Both predate the current palette and the decision to drop
dashboards, so treat them as historical.
