# Custom galaxy docker image
This image is build on top of `quay.io/bgruening/galaxy-exome-seq:miracum_20.09` and only does some minor additions

## additional tool
This image adds the echoTool used to sneak IRIDA parameters into a galaxy pipeline

## galaxy config
This image includes a galaxy config that differs from the sample config in the following ways

* `uwsgi.http = :8080` to bind on all network interfaces
* `galaxy.admin_users = admin@localhost` to grant admin permissions
* `galaxy.allow_path_paste = true` to allow IRIDA to just provide paths to a shared folder instead of uploading files
* `x_frame_options: "allow from http://localhost"` 
