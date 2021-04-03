extern "C" {
    pub fn printf(format: *const u8, ...) -> i32;
}

#[no_mangle]
pub extern "C" fn rust_function(n: i32) {
    unsafe {
        printf(b"Hello from Rust!\n\x00" as *const u8);
    }

    let r = sum_fib(n as usize);

    unsafe {
        printf(b"sum first %d Fibonacci numbers: %d\n\x00" as *const u8, n, r);
    }
}

fn sum_fib(n: usize) -> i32 {
    let mut vec = Vec::with_capacity(n);
    vec.push(0);
    vec.push(1);
    for i in 2..n {
        vec.push(vec[i - 1] + vec[i - 2]);
    }

    let mut sum = 0;
    for i in 0..n {
        sum += vec[i];
    }

    return sum;
}
