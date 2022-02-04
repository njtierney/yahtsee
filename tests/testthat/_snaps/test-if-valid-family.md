# test_if_valid_family with expect_snapshot()

    Code
      test_if_valid_family("gauss")
    Error <rlang_error>
      Must provide valid likelihood family
      x You provided: "gauss"
      i Did you mean: "gamma" and "gaussian"?
      i See `?INLA::inla.models()$likelihood` for all likelihoods

