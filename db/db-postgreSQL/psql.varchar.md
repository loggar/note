# PostgreSQL `varchar`

```py
# PostgreSQL's varchar(256) will store 256 characters regardless of their Unicode representation.
# So we can just check the character length before saving.
def can_store_in_varchar_256(text: str) -> bool:
    return len(text) <= 256
```
