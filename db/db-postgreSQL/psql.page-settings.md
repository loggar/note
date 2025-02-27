# print settings

`\pset` (short for **"print settings"**) is used to configure how query results are displayed. You can modify various settings using `\pset`, but you must specify an option, such as `format`, `pager`, or `expanded`.

---

## **Common `\pset` Commands and Their Effects**

### **1️⃣ Disable Expanded Mode (Prevent Multi-Line Display)**

```sql
\x off
```

or

```sql
\pset expanded off
```

✅ **Ensures columns are displayed in a single row rather than a vertical format.**

---

### **2️⃣ Remove Column Alignment (Single-Line Output)**

```sql
\pset format unaligned
```

✅ **Prints output as a single row without spacing or column alignment.**

Example:

```sql
SELECT 'hello' AS greeting, 123 AS number;
```

**Default (aligned):**

```
 greeting | number
----------+--------
 hello    |    123
(1 row)
```

**With `\pset format unaligned`:**

```
hello|123
```

---

### **3️⃣ Prevent Output Pagination (Avoid `less`/`more` Scrolling)**

```sql
\pset pager off
```

✅ **Stops `psql` from paginating large results (prevents "press ENTER to continue" behavior).**

---

### **4️⃣ Set a Specific Column Width**

```sql
\pset columns 200
```

✅ **Adjusts output width before wrapping text (default is typically 80 characters).**

---

## **Key Takeaway**

- `\pset` **modifies how output is displayed** in `psql`.
- `\pset off` **does not exist**, but you can use `\x off`, `\pset format unaligned`, or `\pset pager off` to control output formatting.
