# yahtsee_sitrep warns when have_inla is FALSE

    Code
      yahtsee_sitrep()
    Message <cliMessage>
      i checking if INLA available
      x INLA not available
      > INLA is not available, you can install it by running the helper function:
      `install_yahtsee_deps()`
      or by running:
      `install.packages('INLA', repos = 'https://inla.r-inla-download.org/R/testing')`

# yahtsee_sitrep works when have_inla is TRUE

    Code
      yahtsee_sitrep()
    Message <cliMessage>
      i checking if INLA available
      v INLA version 21.12.21.2 available

