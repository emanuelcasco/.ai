---
title: Condense Prompts Task
type: task
mode: ultrathink
---

## Purpose

Enable a professional high-fidelity condenser to transform complex source documents into condensed versions that preserve argumentation, examples, causal logic, and emotional tone while tightening language and structure.

## Variables

- $INPUT: Either a file path to a document or a text to be condensed.

## Workflow

### 0. Confirm Inputs and Readiness

- Verify the requester’s objective, risk profile, and expected output format before any condensation work begins.
- Collect the full source text to be condensed; note any segmentation or chunking requirements shared by the requester.

### 1. Run Pre-Analysis

- Identify the document’s main argument, supporting evidence or examples, and the prevailing emotional tone or style; keep brief notes on logic and emotion continuity points.
- Flag gaps or ambiguities to the requester before proceeding; pause if essential context is missing.

### 2. Calibrate Risk Level

- Classify the document as High-, Medium-, or Low-Risk (technical, legal, philosophical content defaults to High-Risk) and tailor caution level accordingly.
- Record the chosen risk tier so later decisions reference the same standard.

### 3. Plan Condensation Passes

- Outline three sequential passes: redundancy removal, phrasing tightening, and overlap merging, pausing if meaning or tone degradation risk appears.
- Define chunking boundaries (≤3,000 words or ≤15,000 tokens) and assign section labels following the `## Section X.X [Chunk Y of Z]` format with continuation markers when needed.
- Schedule mid-chunk continuity reviews (~5k tokens) and a memory map review (~10k tokens) before beginning the first pass.

### 4. Thread Memory Across Chunks

- Maintain a running memory map that tracks logical and emotional progression to inform each chunk’s condensation.
- During each review checkpoint, confirm continuity, flag `[Memory Break Risk Here]` if flow degrades, and activate Risk Escalation Mode when severe breaks appear (pause, map affected chains, resume carefully).

### 5. Anchor Semantics, Tone, and Key Elements

- Preserve critical terminology, definitions, metaphors, and narrative beats; document any items the requester singled out for protection.
- Monitor tone against the source (e.g., legal formality, philosophical nuance, narrative emotion) and call out tone degradation risk explicitly before continuing.

### 6. Execute Layered Condensation

- Conduct pass-by-pass condensation, applying adaptive caution by section type (arguments minimal tightening; theories maximum caution; introductions moderate; narratives preserve rhythm and emotional cadence).
- When standard condensation threatens fidelity, reframe the problematic section carefully and document the rationale before proceeding.

### 7. Enforce Rigid Condensation Rules

- Apply the mandated rules continuously: eliminate redundancy; use active voice; simplify syntax; maximize vocabulary density; omit "there is/are" openings; merge related sentences; remove unnecessary modifiers; parallelize lists; omit obvious details; favor inference-loaded adjectives; prefer direct verbs over nominalizations; strip common knowledge; group logic cleanly; use gerunds strategically; employ safe elliptical constructions; and substitute pronouns intelligently; remove default time phrasing.
- Stop and reassess if any rule conflicts with fidelity or tone requirements; prioritize meaning preservation over brevity.

### 8. Format and Deliver Output

- Produce Markdown-formatted condensed chunks, each labeled per plan and containing bulletized main points and subpoints as needed.
- Include optional confidence flags (High/Medium/Low fidelity) for each section when beneficial, and surface any outstanding risks or escalation notes.

### 9. Perform Final QA

- Confirm main arguments, key examples, causal logic, and emotional tone remain intact across all chunks.
- Ensure chunk sequencing, memory threading, and formatting align with the established plan before handing off to the requester.

### 10. Apply changes

- Apply the changes to the original document.

## Instructions

- Never summarize by omitting essential reasoning or emotional resonance; fidelity to source meaning overrides aggressive shortening.
- Preserve document structure.
- Do not begin condensation until the requester types `Begin Condensation.` and all prerequisite clarifications are resolved.
- Maintain awareness of token limits; chunk, stage, and monitor usage while keeping the requester informed of any risks.
- Pause and escalate when logic flow, tone, or semantic anchors are at risk; document risk handling steps before resuming.
- Preserve all mandatory rules, formatting conventions, and communication checkpoints from this task without exposing template markup to end users.

## Success Criteria

- [ ] Workflow captures end-to-end execution from input confirmation through final QA, including risk calibration, memory threading, and formatting specifics.
- [ ] Instructions reinforce fidelity-first principles, start conditions, and risk escalation practices.
- [ ] Success checks align with preserving key arguments, tone, structure, and formatting expectations.
- [ ] Document contains no unresolved placeholders, template artifacts, or contradictions with the provided protocol.
