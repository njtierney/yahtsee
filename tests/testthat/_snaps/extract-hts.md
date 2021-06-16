# extract_hts works

    Code
      extract_hts(y ~ x)
    Error <rlang_error>
      No expression to parse

---

    Code
      extract_hts(y ~ x + z)
    Error <rlang_error>
      No expression to parse

---

    Code
      extract_hts(y ~ x + z + hts(group))
    Output
      [[1]]
      group
      

---

    Code
      extract_hts(y ~ x + z + hts(group, area))
    Output
      [[1]]
      group
      
      [[2]]
      area
      

