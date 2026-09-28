# Contributing

Contributions are welcome. Fork the repository, make your change, open a pull request.
There is no paperwork to sign.

## Licensing of contributions

This project is licensed under the GNU Affero General Public License v3.0. By opening a
pull request you agree that your contribution is offered under that same licence.

There is **no Contributor License Agreement and no sign-off requirement**. You keep the
copyright on what you write. This project has no commercial version and no plans for one,
so there is no relicensing right to reserve, and nothing for you to sign.

Only submit code you have the right to submit, under the AGPL.

## Never submit real student data

This project handles special-category personal data about minors. Real data must never
appear in this repository, including in tests, fixtures, screenshots, issue reports or
example files. Use synthetic data. A pull request containing real data will be closed
rather than merged.

If you are reporting a bug you found while running a real deployment, describe the
behaviour and reproduce it against synthetic data before filing.

## What the project is and is not

Read `docs/domain-model.md` before proposing changes to the data model. The grain,
the ordinal efficacy scale and the modal aggregation are deliberate and come from how
schools actually work, not from convenience.

Some things are deliberately out of scope: charts and dashboards, multi-school or
multi-tenant support, mobile layouts, and real-time collaborative editing. These are
decisions, not gaps. If you think one is wrong, open an issue to discuss it before
writing code.

## Conventions

- The interface is in European Portuguese. Code, comments, commit messages and
  documentation are in English.
- User-facing strings go through i18n from the start; do not hardcode Portuguese in
  components.
- No emojis in files.
- Accessibility is not optional. The colour palette has one text-safe colour and cannot
  encode meaning through colour alone, so anything conveying state must also convey it
  through text. Keyboard navigation and visible focus are requirements, not extras.

## Reporting issues

Describe what you expected, what happened, and how to reproduce it. If it concerns the
data model or a legal requirement under Decreto-Lei 54/2018, cite the article.
