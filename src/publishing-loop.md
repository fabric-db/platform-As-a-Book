# Publishing Loop

The publishing loop turns the book into a living platform artifact.

## Flow

```text
Change
  -> Review
  -> Validate
  -> Build Book
  -> Publish
  -> Operate
  -> Observe
  -> Improve
```

## GitHub Pages

This repository publishes the mdBook using GitHub Pages.

On every push to `main`, the workflow:

1. checks out the repository
2. installs mdBook
3. builds the book
4. uploads the generated site
5. deploys to Pages

## Publishing Gate

A book change should be rejected when:

- the summary references missing chapters
- a chapter references missing artifacts
- schemas are invalid
- policies are invalid
- generated examples are stale
- the operational impact is unclear

## Book As Release Gate

The book is the release gate for meaning.

The platform may still use CI/CD for code, but the book controls whether humans understand what is being released.
