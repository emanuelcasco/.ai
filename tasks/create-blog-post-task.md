---
title: Create Blog Post
type: task
mode: ultrathink
---

## Purpose

Generate a technical blog post based on a provided topic or request. The goal is to create engaging, informative, and accessible content for a target audience.

## Workflow

### 0. Generate a new blog post document

Create a new file using the `@~/.ai/templates/blog-post.tmp.md` template. Follow these rules:

- Name convention: `yyyymmddhhmmdd_{{title_in_snake_case}}.md`.
- Keep the name under 50 characters (summarize it if necessary).
- Create the file in the folder `/content/posts` or a relevant content directory, if not sure ask the user for details.

### 1. Identify Target Audience & Goal

- Who is the primary audience for this blog post? (e.g., beginners, experienced developers, product managers)
- What is the main goal or key takeaway you want the audience to have after reading this post? (e.g., understand a concept, learn a new skill, be inspired)

### 2. Outline Key Sections

- Brainstorm the main sections or headings that will structure the blog post.
- Consider a logical flow: Introduction, Problem/Context, Solution/Concept, How-to/Details, Benefits/Implications, Conclusion.
- Each section should contribute to the main goal of the post.

### 3. Draft Content for Each Section

- Write clear, concise, and engaging prose for each section.
- Use an active voice and conversational tone where appropriate.
- Simplify complex technical concepts using analogies, examples, and relatable scenarios.
- Include code snippets, diagrams, or images where they enhance understanding.
- Ensure accuracy of all technical information.

### 4. Optimize for Readability and SEO

- Use short paragraphs and sentences.
- Incorporate bullet points and numbered lists for easy scanning.
- Bold keywords or phrases to highlight important information.
- Suggest relevant keywords for SEO, if applicable, without overstuffing.
- Ensure a strong, catchy title and compelling introduction.

### 5. Content Generation

- **Incremental Mode**: Present each major section for review before proceeding
- **YOLO Mode**: Generate all sections, then review complete document with user
- Apply any elicitation protocols specified in template
- Incorporate user feedback and iterate as needed

### 6. Validation

If template specifies a checklist:

- Run the appropriate checklist against completed document
- Document completion status for each item
- Address any deficiencies found
- Present validation summary to user

### 7. Final Presentation

- Present clean, formatted content only
- Ensure all sections are complete
- DO NOT truncate or summarize content
- Begin directly with document content (no preamble)
- Include any handoff prompts specified in template

## Success Criteria

- [ ] **Audience & Goal**: Clearly defined target audience and main objective.
- [ ] **Structure**: Logical flow with clear headings and subheadings.
- [ ] **Clarity & Conciseness**: Easy to understand, free of jargon, no unnecessary words.
- [ ] **Engagement**: Interesting and keeps the reader's attention.
- [ ] **Accuracy**: All technical details are correct and up-to-date.
- [ ] **Examples/Visuals**: Relevant examples, code snippets, or ideas for visuals included.
- [ ] **Call to Action**: Clear next steps or thought-provoking conclusion.
- [ ] **Readability**: Short paragraphs, bullet points, bolding used effectively.
- [ ] **SEO (Optional)**: Relevant keywords considered in title and content.
- [ ] **Template Format**: Follows `blog-post.tmp.md` structure with proper markdown.
- [ ] **Clean Output**: No `[[LLM:]]` markup, no preamble, complete content, date stamped.
