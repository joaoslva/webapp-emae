# EMAE

Ferramenta para equipas EMAEI registarem e analisarem a eficácia das medidas de suporte à
aprendizagem e à inclusão, ao abrigo do Decreto-Lei n.º 54/2018. Substitui o preenchimento
em folhas de Excel partilhadas.

*A tool for EMAEI teams in Portuguese schools to record and analyse the efficacy of
inclusion support measures under Decreto-Lei 54/2018. It replaces a shared-spreadsheet
workflow. The interface is in European Portuguese; code and documentation are in English.*

## Status

Early development. Not yet usable. There is no release and no deployment.

## What it does

A school's EMAEI records, for each student receiving support measures, how effective each
measure is in each subject, each term. The tool captures that, aggregates it, and produces
the per-student evaluation document the school has to issue and sign.

Design decisions that shape it:

- **One school, one instance.** Self-hosted on the school's own infrastructure. The school
  is the data controller; no data leaves its premises.
- **Pseudonymous core.** Statistics join on a student identifier, never on names. The
  identity layer is thin and access-scoped.
- **Configurable measure catalogue.** Measures are seeded from the statute (Articles 8, 9,
  10 and 28) and grouped by article. Schools enable, disable and relabel; they do not
  invent measures from nothing.
- **Export is first-class.** Data can always be exported to Excel or CSV, so returning to
  the previous workflow costs nothing.

## Stack

TypeScript throughout. A framework-free `core` package holds the domain logic, schema and
aggregations. Postgres for storage, a separate API, and a Vite and React single-page
application built to static files, served same-origin behind one reverse proxy.

## Privacy

This software handles special-category personal data about minors under GDPR Article 9.

Development uses synthetic data only. The author does not access real student data. Any
school deploying this is the data controller and is responsible for its own record of
processing activities and, where required, its data protection impact assessment. See
`docs/` for the technical detail a data protection officer would need.

## Licence

GNU Affero General Public License v3.0. See `LICENSE`.

In short: anyone may use, study, modify and share this, including commercially. But anyone
who modifies it and runs it as a network service must publish their modified source under
the same licence. It cannot be turned into a closed, proprietary product.

Copyright (C) 2026 João Silva

This program is free software: you can redistribute it and/or modify it under the terms of
the GNU Affero General Public License as published by the Free Software Foundation, either
version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License along with this
program. If not, see <https://www.gnu.org/licenses/>.

## Documentation

- `docs/domain-model.md` - the data model and where it came from
- `docs/legacy-user-stories.md` - requirements recovered from the first attempt
