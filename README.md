# Platform As A Book

Platform As A Book is a book-driven platform engineering model for Fabric DB.

The book is not documentation after the platform. It is the canonical source that defines the platform's principles, architecture, schemas, policies, protocols, runtime, operations, and publishing loop.

## Core thesis

Traditional platforms drift because vision, architecture, code, deployment, and operations live in separate places.

Platform As A Book closes the loop:

```text
Book
  -> Architecture
  -> Schemas
  -> Policies
  -> Code
  -> Deployment
  -> Runtime
  -> Observability
  -> Book
```

## Build locally

Install mdBook, then run:

```sh
mdbook serve
```

or:

```sh
mdbook build
```

## Publish

The repository includes a GitHub Pages workflow at `.github/workflows/pages.yml`.

On every push to `main`, GitHub Actions builds the book and deploys the generated site to GitHub Pages.
