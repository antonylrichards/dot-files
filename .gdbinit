set solib-absolute-prefix ../../../romfs/lib
set solib-search-path     ../../../romfs/lib
#set solib-search-path     ../../../romfs/lib:../../../uClibc/lib:../../../uClibc/libc:../../../uClibc/libcrypt
handle SIG32 nostop noprint pass

#set solib-absolute-prefix ../../../lib
#set solib-search-path ../../../uClibc/lib:../../../uClibc/libc:../../../uClibc/libcrypt

define ct
  set enable_thread_watching=0
end

