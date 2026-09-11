# Task records and acceptance

This is a recommended interchange convention, not a currently implemented database schema. Adapt it to the user's existing table without discarding information.

## Identity and persistence

Use a stable task ID plus normalized DOI when present. Key requests by `(doi_or_task_id, request_type)`, where request type is `main` or `si`; distinguish later supplementary requests by their missing-file scope and preserve the original request history.

Keep a local manifest outside the source repository. Save after each meaningful transition, preferably via a temporary file followed by an atomic replacement. Never copy another user's absolute paths into a public example. Concurrent workers need serialization or locking before writing shared state or spending.

Each task should carry title, category, user-requested names and version, main status, SI status, completeness evidence, requests, file records and notes. A file record needs type, original attachment label, relative saved path, actual extension/MIME where available, byte count, optional SHA-256, stable source URL, identity evidence and the result of checks. Avoid secret-bearing URLs and identifiers in public exports.

## Independent status dimensions

| Field | Suggested values | Meaning |
|---|---|---|
| Main | `pending`, `candidate`, `downloaded_verified`, `needs_review`, `unavailable`, `not_requested` | File retrieval and identity, not request publication |
| SI | `pending`, `partial`, `downloaded_unverified_completeness`, `complete_verified`, `none_confirmed`, `needs_review`, `unavailable`, `not_requested` | Identity and attachment-set completeness |
| Request | `intent_recorded`, `publication_unknown`, `pending_aid`, `fulfilled_unchecked`, `resolved`, `cancelled`, `needs_user` | Remote request lifecycle, distinct from file acceptance |
| Disposition | `open`, `completed`, `closed_with_accepted_gaps` | User-facing closure, not a substitute for file status |

These are suggested labels, not a requirement to overwrite an existing workbook's vocabulary. Map them explicitly when needed.

## Main acceptance

Confirm a file exists and is parseable, identify the target by DOI and/or sufficiently specific title metadata, and inspect that it is the expected article rather than an abstract, correction, SI or access-error page. Page counts are a supporting signal, not proof. Record formal publication, accepted manuscript and preprint as different versions; accept only versions allowed by the task.

Matching a known file hash is strong evidence of byte identity, but inherits the reference file's own identity uncertainty. Text matching does not establish visual or supplementary completeness. A DOI match alone may justify a candidate, not automatic acceptance of every document carrying that DOI.

## SI acceptance

Record the official or other authoritative attachment enumeration when available, including its source and access date. Keep expected count `null` if unknown, not zero. Each expected entry should have a stable label and a matched file or explicit missing reason. When multiple uploads contain the same attachment, do not count duplicates as additional coverage.

Use `complete_verified` only when the expected set is bounded by sufficient evidence and all required entries are received and identity-checked. If only the discovered links are downloaded but enumeration is unbounded, use `downloaded_unverified_completeness`. Use `partial` when some known required files are absent. Download failures are not proof of no SI.

Use `none_confirmed` only with affirmative, relevant evidence from the official article record or comparably authoritative confirmation. Lack of visible links on a blocked or incomplete page is insufficient. Record the evidence, not only a status word.

Keep original file formats. Peer review, editor correspondence and article graphics are separate categories unless specifically requested. Inspect archives safely; do not execute contents or macros. Preserve attachment order when the source defines it, otherwise document the chosen stable order rather than pretend it is official.

## Completion and reporting

For a main-plus-SI task, `completed` requires main `downloaded_verified` and SI either `complete_verified` or `none_confirmed`. A main-only task may complete with SI `not_requested`. An SI-only task follows SI acceptance without requiring a main download.

When a user accepts unresolved gaps, set disposition `closed_with_accepted_gaps` and leave underlying missing or unverified statuses intact. Report how many papers and files were requested, verified, pending, partial, unverified, confirmed absent and accepted with gaps. Do not combine unlike denominators.

Before spending again on resumption, reconcile `publication_unknown` records. Before copying again, reconcile already verified file records. Preserve originals, user edits and prior outcomes.
