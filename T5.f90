subroutine add(a,b,c,n)
    integer :: n,i
    double precision :: a(n),b(n),c(n)

    do i = 1,n
        c(i) = a(i) + b(i)
    enddo
end subroutine add

program test
    integer,parameter :: MM = 90000000
    double precision, allocatable :: a(:),b(:),c(:)
    double precision :: start,finish

    allocate(a(MM),b(MM),c(MM))
    

    do i = 1,MM
        a(i) = 1.0/dble(i)
        b(i) = a(i)
    enddo
    
    call cpu_time(start)
    call add(a,b,c,MM)
    call cpu_time(finish)

    print*,'time =',(finish-start)

    deallocate(a,b,c)
end program test