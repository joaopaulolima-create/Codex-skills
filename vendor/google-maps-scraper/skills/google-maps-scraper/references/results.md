# Result Handling

CSV output contains a header followed by one business per row.

Count the complete file, deduplicate by `place_id` or normalized business name plus address, and preview at most 20 records. Prefer these fields when present: `title`, `category`, `review_rating`, `review_count`, `phone`, `website`, and `address`.

Help the user filter or rank by the lead signals they requested, such as a missing website, rating range, review volume, neighborhood, or available public business phone. Clearly distinguish captured fields from verified facts.

Do not imply that absent contact information means the business has none. Never send outreach automatically; a human must review the candidate list first.
