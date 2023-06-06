# Composer diff

This action will detect changes to a composer.lock file and will
leave a comment on PRs describing any dependency changes.

## Inputs

- work-dir: Optional directory to check for changes. Defaults to root directory

## Example

```yaml
  - name: Show composer lock diff
    uses: pixelfusion/actions/composer-diff@v1
    with:
      work-dir: 'admin'
```
