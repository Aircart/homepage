#Markdown
set :markdown_engine, :redcarpet

#Livereload
activate :livereload

### 
# Compass
###

# Susy grids in Compass
# First: gem install compass-susy-plugin
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript
  
  # Create favicon/touch icon set from source/favicon_base.png
  activate :favicon_maker
  
  # Enable cache buster
  # activate :cache_buster
  
  # Use relative URLs
  # activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end

activate :s3_sync do |s3_sync|
  s3_sync.bucket                = 'aircartapp.com' # The name of the S3 bucket you are targetting. This is globally unique.
  s3_sync.region                = 'us-east-1'     # The AWS region for your bucket.
  s3_sync.aws_access_key_id     = 'AKIAJFU3X3MOUGRQKHRQ'
  s3_sync.aws_secret_access_key = 'dim9YrqzRCb20yNkrgD1KmCMwhAJafOrx1fdD0Wq'
  s3_sync.delete                = false # We delete stray files by default.
  s3_sync.after_build           = false # We chain after the build step by default. This may not be your desired behavior...
  s3_sync.prefer_gzip           = true
end

# Activate sync extension
# activate :sync do |sync|
#   sync.fog_provider = 'AWS' # Your storage provider
#   sync.fog_directory = 'homepage.aircartapp.com' # Your bucket name
#   sync.fog_region = 'us-east-1' # The region your storage bucket is in (eg us-east-1, us-west-1, eu-west-1, ap-southeast-1 )
#   sync.aws_access_key_id = 'AKIAJ364I6JONIYFIEFA' # Your Amazon S3 access key
#   sync.aws_secret_access_key = '9XKAq3bD7vLsOfCtlya97OJd/zgbkMqZL1PHbrqM' # Your Amazon S3 access secret
#   sync.existing_remote_files = 'delete' # What to do with your existing remote files? ( keep or delete )
#   # sync.gzip_compression = false # Automatically replace files with their equivalent gzip compressed version
#   # sync.after_build = false # Disable sync to run after Middleman build ( defaults to true )
# end