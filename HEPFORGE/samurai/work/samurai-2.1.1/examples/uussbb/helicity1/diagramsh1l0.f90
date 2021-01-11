module     uussbb_diagramsh1l0
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/diagramsh1
   ! l0.f90
   ! generator: haggies (1.1)
   use precision, only: ki
   use uussbb_config
   use uussbb_model
   use uussbb_kinematics
   use uussbb_color
   use uussbb_abbrevh1l0
   implicit none

   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   complex(ki), dimension(numcs), parameter :: zero_col = 0.0_ki

   private :: i_, zero_col
contains
   function     amplitude()
      implicit none
      complex(ki), dimension(numcs) :: amplitude
      complex(ki), dimension(numcs) :: t1
      complex(ki), dimension(numcs) :: t2
      complex(ki), dimension(numcs) :: t3
      complex(ki), dimension(numcs) :: t4
      complex(ki), dimension(numcs) :: t5
      complex(ki), dimension(numcs) :: t6
      complex(ki), dimension(numcs) :: t7
      real(ki) :: t8
      
      call init_abbrev()
      amplitude = 0.0_ki
      
      t8 = TR*TR
      t1 = t8*c3
      t2 = t8/(NC*NC)*c1
      t3 = t1+t2
      t4 = t8/NC*c4
      t5 = t8/NC*c6
      if (debug_lo_diagrams) then
         call inspect_lo_diagram(i_*abb7n1*(-4.0_ki)*(t3-(t5+t4))/(es234*es34*es&
         &56),&
            &7, 1, 19)
      end if
      amplitude = amplitude + (i_*abb7n1*(-4.0_ki)*(t3-(t5+t4))/(es234*es34*es56&
      &))
      t6 = t8*c5
      t2 = t2+t6
      if (debug_lo_diagrams) then
         call inspect_lo_diagram(i_*abb6n1*(-4.0_ki)*(t2-(t5+t4))/((es34+es56-(e&
         &s234+es12))*es34*es56),&
            &6, 1, 19)
      end if
      amplitude = amplitude + (i_*abb6n1*(-4.0_ki)*(t2-(t5+t4))/((es34+es56-(es2&
      &34+es12))*es34*es56))
      t7 = t8/NC*c2
      t3 = t3-t7
      if (debug_lo_diagrams) then
         call inspect_lo_diagram((i_*abb5n1*(4.0_ki)*(t3-t5)/((es12+es56-(es34+e&
         &s123))*es56)),&
            &5, 1, 19)
      end if
      amplitude = amplitude + ((i_*abb5n1*(4.0_ki)*(t3-t5)/((es12+es56-(es34+es1&
      &23))*es56)))
      t2 = t2-t7
      if (debug_lo_diagrams) then
         call inspect_lo_diagram(i_*abb4n1*(-4.0_ki)*(t2-t5)/es56,&
            &4, 1, 19)
      end if
      amplitude = amplitude + (i_*abb4n1*(-4.0_ki)*(t2-t5)/es56)
      if (debug_lo_diagrams) then
         call inspect_lo_diagram((i_*abb3n1*(4.0_ki)*(t2-t4)/(es34*es345)),&
            &3, 1, 19)
      end if
      amplitude = amplitude + ((i_*abb3n1*(4.0_ki)*(t2-t4)/(es34*es345)))
      if (debug_lo_diagrams) then
         call inspect_lo_diagram(i_*abb2n1*(-4.0_ki)*(t3-t4)/((es12+es34-(es56+e&
         &s345))*es34),&
            &2, 1, 19)
      end if
      amplitude = amplitude + (i_*abb2n1*(-4.0_ki)*(t3-t4)/((es12+es34-(es56+es3&
      &45))*es34))
      t1 = t6-t1
      t8 = es34*es56
      if (debug_lo_diagrams) then
         call inspect_lo_diagram(((2.0_ki)*(i_*abb1n2*t1/t8+i_*abb1n4*t1/t8+i_*a&
         &bb1n6*t1/t8-(i_*abb1n5*t1/t8+i_*abb1n3*t1/t8+i_*abb1n1*t1/t8))),&
            &1, 1, 19)
      end if
      amplitude = amplitude + (((2.0_ki)*(i_*abb1n2*t1/t8+i_*abb1n4*t1/t8+i_*abb&
      &1n6*t1/t8-(i_*abb1n5*t1/t8+i_*abb1n3*t1/t8+i_*abb1n1*t1/t8))))
   end function     amplitude
end module uussbb_diagramsh1l0

