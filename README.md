# dev-base

This Dockerfile builds a ubuntu image intended as a common base for language-specific or project-specific development images. The goal is to eliminate duplication of boilerplate configuration needed to make the container more suitable for interactive use. This includes setting the timezone and locale, and creating a non-root sudo user. No assumptions are made about derived containers i.e. no compilers, version control, build system, libraries, etc... are included.

Changes to this Dockerfile trigger automatic builds for mosherbd/dev-base on Docker Hub.

Scripts are copied to /usr/local/bin so that they can be used in derived images.
