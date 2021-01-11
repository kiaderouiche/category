module     uussbb_abbrevh2l0
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
   complex(ki) :: abb1n7
   complex(ki) :: abb1n8
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

      t1 = spak1k5*spak2k3*spbk4k2*spbk6k2
      abb7n1 = (t1+spak1k5*spak3k4*spbk4k2*spbk6k4)
      t2 = spak1k3*spak1k5
      t3 = t2*spbk4k1*spbk6k2
      t4 = spak1k3*spak3k5
      abb6n1 = (t4*spbk4k3*spbk6k2-t3)
      t5 = spak1k2/es12*spak3k5*spbk4k2*spbk6k2
      t6 = spak1k4/es12*spak3k5*spbk4k2*spbk6k4
      abb5n1 = (t6-t5)
      t7 = t2*spbk2k1*spbk6k4
      t11 = es12*es123
      t8 = t4*spbk3k2*spbk6k4
      abb4n1 = (t7/t11+t8/t11)
      t9 = spak1k6/es12*spak3k5*spbk6k2*spbk6k4
      abb3n1 = (t5+t9)
      t5 = spak1k5*spak3k5
      t10 = t5/es12*spbk5k2*spbk6k4
      abb2n1 = (t10-t7/es12)
      abb1n1 = (t3/es12)
      abb1n2 = (t2/es12*spbk4k2*spbk6k1)
      abb1n3 = (t8/es12)
      abb1n4 = (t4/es12*spbk4k2*spbk6k3+spak1k3/es12*spak2k5*spbk4k2*spbk6k2+spa&
      &k1k3/es12*spak4k5*spbk4k2*spbk6k4)
      abb1n5 = (t6+t1/es12)
      abb1n6 = t10
      abb1n7 = (t5/es12*spbk5k4*spbk6k2+spak1k5/es12*spak3k6*spbk6k2*spbk6k4)
      abb1n8 = t9
   end subroutine init_abbrev
end module uussbb_abbrevh2l0
