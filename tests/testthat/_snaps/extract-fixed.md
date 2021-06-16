# extract_fixed works

    Code
      extract_fixed(y ~ x)
    Output
      x

---

    Code
      extract_fixed(y ~ x + z)
    Output
      x + z

---

    Code
      extract_fixed(y ~ x + z + hts(group))
    Output
      x + z

---

    Code
      extract_fixed(y ~ x + z + hts(group, area))
    Output
      x + z

