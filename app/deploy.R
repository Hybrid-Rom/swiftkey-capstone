

# create a directory to build the deployable package
path <- file.path (tempdir(), "deploy")

# recreate the directory to start fresh
unlink (path, recursive = TRUE)
dir.create (path)

# copy all 'lib' sources
file.copy (list.files ("lib", full.names = TRUE), path)

# copy all 'app' sources
file.copy (list.files ("app", full.names = TRUE), path)

# define the token for deployment
shinyapps::setAccountInfo(name='farsite',
                          token='C419EC230C4EABCF534F83566F2D1DAE',
                          secret='<SECRET>')

# deploy
shinyapps::deployApp (appDir = path, appName = "swiftkey-cap", upload = TRUE)

