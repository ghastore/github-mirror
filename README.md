# GitHub Mirror

Universal mirroring repository tool.

## Workflow Syntax

### GitHub > GitLab

```yml
name: "Mirror"

on:
  - push

jobs:
  mirror:
    runs-on: ubuntu-latest
    name: "Mirror"
    steps:
      - uses: ghastore/git-mirror@main
        with:
          src_repo: "https://github.com/${{ github.repository }}.git"
          src_user: "${{ secrets.MIRROR_SOURCE_USER_GITHUB }}"
          src_token: "${{ secrets.MIRROR_SOURCE_TOKEN_GITHUB }}"
          dst_repo: "https://gitlab.com/${{ github.repository }}.git"
          dst_user: "${{ secrets.MIRROR_TARGET_USER_GITLAB }}"
          dst_token: "${{ secrets.MIRROR_TARGET_TOKEN_GITLAB }}"
```

### GitHub > GitHub

```yml
name: "Mirror"

on:
  - push

jobs:
  mirror:
    runs-on: ubuntu-latest
    name: "Mirror"
    steps:
      - uses: ghastore/git-mirror@main
        with:
          src_repo: "https://github.com/${{ github.repository }}.git"
          src_user: "${{ secrets.MIRROR_SOURCE_USER_GITHUB }}"
          src_token: "${{ secrets.MIRROR_SOURCE_TOKEN_GITHUB }}"
          dst_repo: "${{ secrets.MIRROR_TARGET_URL_GITHUB }}"
          dst_user: "${{ secrets.MIRROR_TARGET_USER_GITHUB }}"
          dst_token: "${{ secrets.MIRROR_TARGET_TOKEN_GITHUB }}"
```

## Legend

- `src_repo` - source repository URL.
- `src_user` - source user.
- `src_token` - source token.
- `dst_repo` - destination repository URL.
- `dst_user` - destination user.
- `dst_token` - destination token.
