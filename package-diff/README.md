# Package diff

This action will detect changes to a packace-lock.json file and will
leave a comment on PRs describing any dependency changes.

Note: There is currently a bug where removed packages are shown
as added, and vice versa. See https://github.com/madiweaver/lock-diff/issues/19

## Inputs

- work-dir: Optional directory to check for changes. Defaults to root directory

## Example

```yaml
  - name: Show composer lock diff
    uses: pixelfusion/actions/package-diff@v1
    with:
      work-dir: 'admin'
```
