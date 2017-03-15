#include <stdio.h>

int main(void) {
#if defined(__ARM_PCS_VFP)
  puts("armhf");
#elif defined(__ARMEL__)
  puts("armel");
#elif defined(__i386__)
  puts("i386");
#elif defined(__x86_64__)
  puts("amd64");
#elif defined(__aarch64__)
  puts("arm64");
#endif
}
