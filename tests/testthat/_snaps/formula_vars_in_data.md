# formula_vars_in_data works

    Code
      formula_vars_in_data(data = malaria_africa_ts, formula = pr ~ dates)
    Error <rlang_error>
      Not all variables in the formula were present in the data
      i Formula: pr ~ dates
      v Variables in data: `pr`
      x Variables not in data: `dates`
      i Double check the formula

---

    Not all variables in the formula were present in the data
    i Formula: pr ~ month_nums
    v Variables in data: `pr`
    x Variables not in data: `month_nums`
    i Double check the formula

