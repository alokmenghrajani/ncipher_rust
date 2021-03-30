#![no_std]
extern "C" {
    pub fn printf(format: *const u8, ...) -> i32;
}

#[no_mangle]
pub extern "C" fn rust_function() {
    unsafe {
        printf(b"Hello from Rust!\n\x00" as *const u8);
    }

    let n = fib(10);

    unsafe {
        printf(b"10th Fibonacci number: %d\n\x00" as *const u8, n);
    }
}

fn fib(n: i32) -> i32 {
    match n {
        0 => 0,
        1 => 1,
        _ => fib(n - 1) + fib(n - 2),
    }
}

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_panic: &PanicInfo<'_>) -> ! {
    loop {}
}
