#! /bin/bash

echo ""
echo "delete webapp pod.."
echo ""
podman pod rm -f webapp
echo ""
podman pod list
podman ps
echo ""
echo "All the pod are deleted....!!!!!!"
