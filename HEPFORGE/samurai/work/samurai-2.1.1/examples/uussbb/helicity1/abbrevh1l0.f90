module     uussbb_abbrevh1l0
   use precision, only: ki
   use uussbb_kinematics
   implicit none
   save
   complex(ki) :: abb7n1
   complex(ki) :: abb6n1
   complex(ki) :: abb5n1
   complex(ki) :: abb4n1
   complex(ki) :: abb3n1
   complex(ki) :: abb2n1
   complex(ki) :: abb1n1
   complex(ki) :: abb1n2
   complex(ki) :: abb1n3
   complex(ki) :: abb1n4
   complex(ki) :: abb1n5
   complex(ki) :: abb1n6
contains
   subroutine     init_abbrev()
      implicit none
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      complex(ki) :: t4
      complex(ki) :: t5
      complex(ki) :: t6
      complex(ki) :: t7
      complex(ki) :: t8
      complex(ki) :: t9
      complex(ki) :: t10
      real(ki) :: t11

      t1 = spak1k5*spak2k4*spbk3k2*spbk6k2
      abb7n1 = (spak1k5*spak3k4*spbk3k2*spbk6k3-t1)
      t2 = spak1k4*spak1k5
      t3 = t2*spbk3k1*spbk6k2
      t4 = spak1k4*spak4k5
      abb6n1 = (t3+t4*spbk4k3*spbk6k2)
      t5 = t2/es12*spbk2k1*spbk6k3
      t6 = t4/es12*spbk4k2*spbk6k3
      abb5n1 = (t5+t6)
      t7 = spak1k2*spak4k5*spbk3k2*spbk6k2
      t11 = es12*es123
      t8 = spak1k3*spak4k5*spbk3k2*spbk6k3
      abb4n1 = (t8/t11-t7/t11)
      t9 = spak1k6/es12*spak4k5*spbk6k2*spbk6k3
      abb3n1 = (t9+t7/es12)
      t7 = spak1k5*spak4k5
      t10 = t7/es12*spbk5k2*spbk6k3
      abb2n1 = (t10-t5)
      abb1n1 = (t3/es12+t8/es12)
      abb1n2 = (t2/es12*spbk3k2*spbk6k1+t4/es12*spbk3k2*spbk6k4+spak1k4/es12*spa&
      &k2k5*spbk3k2*spbk6k2+spak1k4/es12*spak3k5*spbk3k2*spbk6k3)
      abb1n3 = (t6+t1/es12)
      abb1n4 = t10
      abb1n5 = (t7/es12*spbk5k3*spbk6k2+spak1k5/es12*spak4k6*spbk6k2*spbk6k3)
      abb1n6 = t9
   end subroutine init_abbrev
end module uussbb_abbrevh1l0
