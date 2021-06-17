# test_if_terms_repeated() works

    Code
      test_if_terms_repeated(y ~ x + y)
    Error <rlang_error>
      Response term must only be used as response
      `y ~ x + y`
      The response `y` was used on the right hand side of the formula in the fixed
      effects. The response should only be on the left hand side of the formula, and
      not be repeated.
      x y ~ hts(x) + y
      v y ~ hts(x)

---

    Code
      test_if_terms_repeated(y ~ x + hts(y))
    Error <rlang_error>
      Response term must only be used as response
      `y ~ x + hts(y)`
      The response `y` was used on the right hand side of the formula in the `hts()`
      component. The response should only be on the left hand side of the formula.
      x y ~ x + hts(y)
      v y ~ x + hts(z)

---

    Code
      test_if_terms_repeated(y ~ x + hts(x))
    Error <rlang_error>
      Fixed term must only be used in fixed effects, not in `hts()`
      `y ~ x + hts(x)`
      A fixed term was used inside the `hts()` call
      x y ~ x + hts(x)
      v y ~ x + hts(z)

