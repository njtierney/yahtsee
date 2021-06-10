# test_if_hts_not_in_formula errors appropriately

    Code
      test_if_hts_not_in_formula(y ~ x)
    Error <rlang_error>
      formula must contain `hts()` with arguments
      i correct = `fit_hts(y ~ x1 + x2 + hts(country, region, continent)`)
      x incorrect = `fit_hts(y ~ x1 + x2`)
      x incorrect = `fit_hts(y ~ x1 + x2 + hts()`)

---

    Code
      test_if_hts_not_in_formula(y ~ x + hts())
    Error <rlang_error>
      `hts()` must contain arguments
      i correct = `fit_hts(y ~ x1 + x2 + hts(country, region, continent)`)
      x incorrect = `y ~ x1 + x2 + hts()`

