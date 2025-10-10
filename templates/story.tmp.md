---
title: Story
type: template
---

## Story

> **As a** {{role}} > **I want** {{action}} > **so that** {{benefit}}

{{Minor extra-context if needed}}

[[LLM: Only add extra-content if you consider that it will help to better understand the issue scope and goal without reading the rest of the issue (like a TL;DR;), as sometimes the issue title and story is not enough.]]

## Acceptance Criteria (ACs)

{{ Acceptance Criteria checklist (fallback to numbered list if not available) }}

## Dev Notes

[[LLM: populates relevant information, only what was pulled from actual artifacts from docs folder, relevant to this story. Do not invent information. Critical: If known add Relevant Source Tree info that relates to this story. If there were important notes from previous story that are relevant to this one, also include them here if it will help the dev agent. You do NOT need to repeat anything from coding standards or test standards as the dev agent is already aware of those. The dev agent should NEVER need to read the PRD or architecture documents or child documents though to complete this self contained story, because your critical mission is to share the specific items needed here extremely concisely for the Dev Agent LLM to comprehend with the least about of context overhead token usage needed.]]
