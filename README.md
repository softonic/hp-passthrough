# HP Passthrough Middleware

[Homing pigeon](https://github.com/softonic/homing-pigeon) middleware that just pass the data.

### Overview

This dummy middleware can be used as base middleware to do your own implementations.

### Requirements

All the [Homing pigeon](https://github.com/softonic/homing-pigeon) middlewares must accept at least the next env vars.

| Name       | Description                                | Example                                                                              |
| ---------- | ------------------------------------------ | ------------------------------------------------------------------------------------ |
| IN_SOCKET  | Socket where the data will be received     | `"/sockets/input.sock"`                                                              |
| OUT_SOCKET | Socket to send data to the next middleware | `"passthrough:///unix:///sockets/input.sock"` or `""` if this is the last middleware |

### How it works

The middleware receives a `github.com/softonic/homing-pigeon/middleware` message as request in the `IN_SOCKET`, so you can
modify the input data to send it to the next middlewares. After the next middlewares are executed, it intercepts the response
so it can be modified again before it is finally returned.

The main homing-pigeon package come with an `UnimplementedMiddleware` to allow you to implement just the middleware bussiness logic. If you need
more control, you can implement your middleware from scratch. Take a look at `UnimplementedMiddleware` to know the basic implementation.

### Usage

You just need to execute the binary or use docker to automatically run it. If you want to show some logging in the output, you can use the [kglog](https://github.com/kubernetes/klog) flags in the command.