if(EXISTS "/home/caio/ITA/5_semestre/CES-12/Labs/Lab4/build/labSSPtests[1]_tests.cmake")
  include("/home/caio/ITA/5_semestre/CES-12/Labs/Lab4/build/labSSPtests[1]_tests.cmake")
else()
  add_test(labSSPtests_NOT_BUILT labSSPtests_NOT_BUILT)
endif()
