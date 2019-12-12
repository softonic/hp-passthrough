package main

import (
	"context"
	"github.com/softonic/homing-pigeon/pkg/middleware"
	"github.com/softonic/homing-pigeon/proto"
	"log"
)

type PassthroughMiddleware struct {
	middleware.UnimplementedMiddleware
}

func (m *PassthroughMiddleware) Handle(ctx context.Context, req *proto.Data) (*proto.Data, error) {

	// Do things with the INPUT data
	log.Printf("Pre-Processing %v", *req)

	// Send data to the next middleware and got the response
	resp, err := m.Next(req)

	// Do things with the OUTPUT data
	log.Printf("Post-Processing %v", *resp)

	return resp, err
}

func main() {
	middleware := &PassthroughMiddleware{}
	middleware.Listen(middleware)
}
