# AGENTS.md

A minimal Docker image wrapping [diceware](https://github.com/ulif/diceware)
(pinned to `1.0.1`), based on `python:3.15.0b3-alpine`.

## Project Layout

```text
.
├── Dockerfile              # Python Alpine + pip-installed diceware
├── docker-entrypoint.sh    # ENTRYPOINT script
├── README.md
├── .pre-commit-config.yaml
└── .github/workflows/
    ├── docker-publish.yml  # Build, test, push to Docker Hub + GHCR
    └── shellcheck.yml      # Lints docker-entrypoint.sh
```

## Build / Run Commands

```bash
docker build -t diceware .
docker run -it --rm diceware                # generate a password
docker run -it --rm diceware --help
docker run -it --rm diceware -n 4 -d- -s 2  # 4 words, '-' delim, 2 special
```

## Code Style

- Dockerfile uses `RUN set -ex` and `COPY --link` for cache-friendly layers.
- Pin the `diceware` version explicitly via `pip install diceware==<version>`.
- Pre-commit hooks (`.pre-commit-config.yaml`): actionlint, gitleaks, hadolint
  (Dockerfile linting), markdownlint-cli2.

## CI/CD

- `docker-publish.yml`: builds the image, tests it, and pushes to
  Docker Hub (`chorrell/diceware`) and GHCR (`ghcr.io/chorrell/diceware`)
  on merge to `main`.
- `shellcheck.yml`: lints shell scripts on PRs.

## Contributing

1. Branch from `main`.
2. Run `pre-commit run --all-files` before committing.
3. Verify locally:
   `docker build -t diceware . && docker run -it --rm diceware --help`.
4. Open a PR; CI runs the build/test and shellcheck workflows.
