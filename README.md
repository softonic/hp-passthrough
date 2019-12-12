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