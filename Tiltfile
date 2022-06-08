# docker_build(
#     'gitops-hugo-dev',
#     context='.',
#     dockerfile='./Dockerfile',
#     live_update=[
#         sync('.', '/src'),
#         run('make build')
#     ]
# )

docker_build("davidwmcneill/gitops-hugo-dev", ".")

k8s_custom_deploy(
  "gitops-hugo-dev",
  apply_cmd=""",
    kubectl -v=0 set image -n app-frontend deployment/gitops-hugo-dev *=$TILT_IMAGE_0 > /dev/null && \
      kubectl get -n app-frontend deployment/gitops-hugo-dev -o yaml
  """,
  delete_cmd="echo Myapp managed outside of Tilt",
  deps=['.'],
  image_deps=["davidwmcneill/gitops-hugo-dev"]
)

# testing but not needed with the ingress 
k8s_resource("gitops-hugo-dev", port_forwards="8090:8080")


# docker_build(
#   "myappimage",
#   "myapp"
#   live_update=[sync("./myapp", "/app")]
# )
# k8s_custom_deploy(
#   "myapp",
#   apply_cmd="""
#     kubectl -v=0 set image deployment/myapp *=$TILT_IMAGE_0 > /dev/null && \
#       kubectl get deployment/myapp -o yaml
#   """
#   delete_cmd="echo Myapp managed outside of Tilt",
#   image_deps=["myappimage"]
# )