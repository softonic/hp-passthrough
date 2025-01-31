module github.com/softonic/hp-passthrough

require (
	github.com/softonic/homing-pigeon v0.0.0-incompatible
	k8s.io/klog v1.0.0
)

require (
	github.com/golang/protobuf v1.5.4 // indirect
	golang.org/x/net v0.29.0 // indirect
	golang.org/x/sys v0.25.0 // indirect
	golang.org/x/text v0.18.0 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20240903143218-8af14fe29dc1 // indirect
	google.golang.org/grpc v1.68.1 // indirect
	google.golang.org/protobuf v1.35.2 // indirect
)

replace github.com/softonic/homing-pigeon => ../homing-pigeon

go 1.23.0

toolchain go1.23.4
