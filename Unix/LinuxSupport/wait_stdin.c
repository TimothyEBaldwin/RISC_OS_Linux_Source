#include <poll.h>

int main(void) {
  struct pollfd p = {0, POLLIN, 0};
  poll(&p, 1, 2000);
  return !(p.revents & POLLHUP) || !!(p.revents & POLLIN);
}
