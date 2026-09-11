# AbleSci request and collection workflow

Use this reference only for a user-authorized AbleSci route. This project is independent of AbleSci. Neither account access nor publication of a paper request grants permission to redistribute the retrieved paper publicly.

## Preconditions and spending

Confirm the relevant account through visible account UI, the intended requests, and the points cap. Read current page rules: batch size, main/SI minimum rewards, balance requirements, request frequency and any download charges. Historic example prices are not defaults.

Estimate the planned liability using only missing, unrequested items. Track confirmed spending and outstanding reserved liability separately without double counting: when the platform deducts points immediately, that request is spent, not also reserved. Retain a conservative reservation for an uncertain publication until reconciled. Record refunds separately.

Ask once for missing budget authorization; a specific user-approved batch and cap permits requests within that scope without asking per row. Do not donate, purchase credits, raise rewards, prioritize posts or pay download fees without appropriate authorization. If the cap or page conditions no longer permit an action, defer it and continue other work.

## Reconcile before publishing

Match each task to existing requests by normalized DOI and `main` versus `si`. Inspect fulfilled requests for usable files; retain still-pending ones. If an old request is ambiguous, resolve its type before adding another.

Write an intent record with a local attempt ID before each publication or batch submission. Store confirmed remote IDs and stable request-page URLs after submission. If the tool disconnects or the page times out, mark `publication_unknown`, reserve the possible liability and inspect request history before resubmitting. Do not auto-resubmit while uncertainty remains.

## Main text batch

Use the current supported batch interface for missing main texts, keeping task order. Inspect extracted metadata and reward values before submitting. Check outcomes per row; partial batch success is not all-or-nothing. Do not treat landing on a results page as evidence every row was published.

## SI requests

Use the page's SI-only request type, separate from the main-text request. Verify the form reflects that type and its current cost. A suggested request note is:

> 求助该论文全部 Supplementary / Supporting Information，包括补充文档、表格及其他随文附件；若有多份，请一并提供。

When some attachments are already held, name the missing items and avoid requesting duplicates. Do not infer absent SI from article type or an inaccessible publisher page.

## Waiting and collection

Use a small set of working pages where feasible: batch results, SI submission, request history/collection. A collection checkpoint after about five SI tasks is a useful starting point, not a platform requirement. Slow down when rate limits or server instructions require it; no repeated empty rapid polls.

Persistent monitoring needs an actual scheduler and user authorization. Notify on new actionable files, completion, failures or required input, rather than unchanged status. Without scheduling, leave a resumable record rather than claim to keep watching after the task stops.

Download only through legitimate page links and supported tools. Download URLs may contain expiring secrets: use them transiently, but omit token-bearing URLs from durable reports and public logs. Record stable article/request URLs and sanitized attachment names instead.

Stage files before classification. Receiving an upload does not prove its identity or completeness. Accept/reject an aid response only after the relevant evidence checks and within user-authorized account actions; if the evidence is inconclusive, leave it for review rather than finalize it solely to clear the queue.

## Failures and manual handoff

Expired login, verification challenges, unexpected pricing and account warnings are distinct from missing resources. Preserve the task and request ID. Do not switch accounts, evade limits or replay undocumented authenticated endpoints. A user can manually publish or download a file and then resume the same manifest without losing progress.

Official entry points: [mutual-aid guide](https://www.ablesci.com/post/detail?id=lQR9by), [help center](https://www.ablesci.com/knowledge/index). Verify live operational rules before spending; an old guide is not proof of current prices or automated-access permission.
