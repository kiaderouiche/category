module     uussbb_model
   ! Model parameters for the model: 
   use precision
   implicit none
   real(ki), parameter :: TR = 0.5_ki
   real(ki), parameter :: sqrt2 = &
      &1.414213562373095048801688724209698078&
      &5696718753769480731766797379_ki
   integer :: samurai_method = 1
   integer :: samurai_scalar = 1
   integer :: samurai_verbosity = 0
   integer :: samurai_test = 0
   complex(ki), parameter :: VUD = (1.0_ki, 0.0_ki)
   real(ki), parameter :: gs = 1.0_ki
   real(ki) :: Nf = 5.0_ki
   complex(ki), parameter :: VUS = (0.0_ki, 0.0_ki)
   real(ki) :: mtau = 1.77684_ki
   real(ki) :: cw =  0.8768181_ki
   complex(ki), parameter :: CVBC = (0.0_ki, 0.0_ki)
   complex(ki), parameter :: VUB = (0.0_ki, 0.0_ki)
   real(ki) :: NC = 3.0_ki
   complex(ki), parameter :: VTS = (0.0_ki, 0.0_ki)
   real(ki), parameter :: mD = 0.0_ki
   complex(ki), parameter :: VCB = (0.0_ki, 0.0_ki)
   complex(ki), parameter :: VTB = (1.0_ki, 0.0_ki)
   complex(ki), parameter :: VCD = (0.0_ki, 0.0_ki)
   complex(ki), parameter :: VTD = (0.0_ki, 0.0_ki)
   real(ki), parameter :: mC = 0.0_ki
   real(ki), parameter :: mB = 0.0_ki
   real(ki) :: mmu = 0.105658367_ki
   complex(ki), parameter :: CVDC = (0.0_ki, 0.0_ki)
   complex(ki), parameter :: CVBU = (0.0_ki, 0.0_ki)
   real(ki) :: mH = 114.4_ki
   complex(ki), parameter :: CVBT = (1.0_ki, 0.0_ki)
   real(ki), parameter :: mU = 0.0_ki
   real(ki) :: mT = 171.2_ki
   real(ki) :: mW = 80.398_ki
   complex(ki), parameter :: VCS = (1.0_ki, 0.0_ki)
   real(ki), parameter :: mS = 0.0_ki
   complex(ki), parameter :: CVDU = (1.0_ki, 0.0_ki)
   complex(ki), parameter :: CVDT = (0.0_ki, 0.0_ki)
   real(ki) :: mZ = 91.1876_ki
   real(ki) :: me = 0.000510998910_ki
   real(ki), parameter :: e = 1.0_ki
   real(ki) :: sw =  0.4808222_ki
   complex(ki), parameter :: CVSC = (1.0_ki, 0.0_ki)
   complex(ki), parameter :: CVST = (0.0_ki, 0.0_ki)
   complex(ki), parameter :: CVSU = (0.0_ki, 0.0_ki)
   real(ki) :: NA

   integer, parameter, private :: line_length = 80
   integer, parameter, private :: name_length = max(4,17)
   character(len=name_length), dimension(11) :: names = (/& 
      & "Nf  ", &
      & "mtau", &
      & "cw  ", &
      & "NC  ", &
      & "mmu ", &
      & "mH  ", &
      & "mT  ", &
      & "mW  ", &
      & "mZ  ", &
      & "me  ", &
      & "sw  "/)
   character(len=1), dimension(3) :: cc = (/'#', '!', ';'/)

   private :: digit
contains
   function     digit(ch, lnr) result(d)
      implicit none
      character(len=1), intent(in) :: ch
      integer, intent(in) :: lnr
      integer :: d
      d = -1
      select case(ch)
         case('0')
            d = 0
         case('1')
            d = 1
         case('2')
            d = 2
         case('3')
            d = 3
         case('4')
            d = 4
         case('5')
            d = 5
         case('6')
            d = 6
         case('7')
            d = 7
         case('8')
            d = 8
         case('9')
            d = 9
         case default
            write(*,'(A21,1x,I5)') 'invalid digit in line', lnr
            stop
         end select
   end function digit

   function     parsereal(str, lnr) result(num)
      implicit none
      character(len=*), intent(in) :: str
      integer, intent(in) :: lnr
      integer, dimension(0:3,0:4), parameter :: DFT = &
      & reshape( (/1,  1,  2, -1,   & ! state = 0
      &            1, -1,  2,  3,   & ! state = 1
      &            2, -1, -1,  3,   & ! state = 2
      &            4,  4, -1, -1,   & ! state = 3
      &            4, -1, -1, -1/), (/4, 5/))
      real(ki) :: num
      integer :: i, expo, ofs, state, cclass, d, s1, s2
      num = 0.0_ki
      expo = 0
      state = 0
      ofs = 0
      s1 = 1
      s2 = 1
      d = -1
      cclass = -1
      do i=1,len(str)
         select case(str(i:i))
         case('_', '''', ' ')
            cycle
         case('+', '-')
            cclass = 1
         case('.')
            cclass = 2
         case('E', 'e')
            cclass = 3
         case default
            cclass = 0
            d = digit(str(i:i), lnr)
         end select
         if (cclass .eq. 0) then
            select case(state)
            case(0, 1)
               num = 10.0_ki * num + d
            case(2)
               num = 10.0_ki * num + d
               ofs = ofs - 1
            case(4)
               expo = 10 * expo + d
            end select
         elseif ((cclass .eq. 1) .and. (str(i:i) .eq. '-')) then
            if (state .eq. 0) then
               s1 = -1
            else
               s2 = -1
            endif
         end if
         ! Advance in the DFT
         state = DFT(cclass, state)
         if (state < 0) then
            write(*,'(A21,1x,A1,1x,A7,I5)') 'invalid position for', &
            & str(i:i), 'in line', lnr
            stop
         end if
      end do
      num = s1 * num * 10.0_ki**(ofs + s2 * expo)
   end function parsereal

   subroutine     parse(aunit)
      implicit none
      integer, intent(in) :: aunit
      character(len=line_length) :: line, rvalue, ivalue
      character(len=name_length) :: name
      real(ki) :: re, im
      integer :: ios, idx, lnr, nidx
      lnr = 0
      loop1: do
         read(unit=aunit,fmt='(A80)',iostat=ios) line
         if(ios .ne. 0) exit
         lnr = lnr + 1
         line = adjustl(line)
         if (line .eq. '') cycle loop1
         if (any(cc .eq. line(1:1))) cycle loop1
         idx = scan(line, '=', .false.)
         if (idx .eq. 0) then
            write(*,'(A13,1x,I5)') 'error at line', lnr
            stop
         end if
         name = line(1:idx-1)
         line = line(idx+1:line_length)
         idx = scan(line, ',', .false.)
         if (name .eq. "samurai_scalar") then
               re = parsereal(line, lnr)
               samurai_scalar = int(re)
               cycle loop1
         elseif (name .eq. "samurai_method") then
               re = parsereal(line, lnr)
               samurai_method = int(re)
               cycle loop1
         elseif (name .eq. "samurai_verbosity") then
               re = parsereal(line, lnr)
               samurai_verbosity = int(re)
               cycle loop1
         elseif (name .eq. "samurai_test") then
               re = parsereal(line, lnr)
               samurai_test = int(re)
               cycle loop1
         elseif (any(names .eq. name)) then
            do nidx=1,size(names)
               if (names(nidx) .eq. name) exit
            end do
            if (idx .gt. 0) then
               rvalue = line(1:idx-1)
               ivalue = line(idx+1:line_length)
               re = parsereal(rvalue, lnr)
               im = parsereal(ivalue, lnr)
            else
               re = parsereal(line, lnr)
               im = 0.0_ki
            end if
            select case (nidx)
            case(1)
               Nf = re
            case(2)
               mtau = re
            case(3)
               cw = re
            case(4)
               NC = re
            case(5)
               mmu = re
            case(6)
               mH = re
            case(7)
               mT = re
            case(8)
               mW = re
            case(9)
               mZ = re
            case(10)
               me = re
            case(11)
               sw = re
            end select
         end if
      end do loop1
   end subroutine parse
end module uussbb_model
