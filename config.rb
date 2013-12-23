require 'slim'

set :encoding, "utf-8"

I18n.enforce_available_locales = true
#Markdown
set :markdown_engine, :kramdown

#Livereload
activate :livereload

activate :syntax, :line_numbers => false
activate :directory_indexes


# Activate sync extension
activate :sync do |sync|
  sync.fog_provider = 'AWS' # Your storage provider
  sync.fog_directory = 'a.danwin.com' # Your bucket name
  sync.fog_region = 'us-east-1' # The region your storage bucket is in (eg us-east-1, us-west-1, eu-west-1, ap-southeast-1 )
  sync.aws_access_key_id = 'AKIAJM7O5RBD23P7G5DA' # Your Amazon S3 access key
  sync.aws_secret_access_key = '9Z3csSXHjCnTf6kx2HxDoer29YyPRDzVojIeOvHA' # Your Amazon S3 access secret
  sync.existing_remote_files = 'keep' # What to do with your existing remote files? ( keep or delete )
  # sync.gzip_compression = false # Automatically replace files with their equivalent gzip compressed version
  # sync.after_build = false # Disable sync to run after Middleman build ( defaults to true )
end


###
# Page options, layouts, aliases and proxies
###



set :layout, :page

page "/", :layout => :home do 
  @hide_nav = true
end





###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end


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

# Site Settings
@analytics_account = false
@typekit_account = 'deu1taf'

# Asset Settings
set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/img'

# Add bower's directory to sprockets asset path
after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Create favicon/touch icon set from source/favicon_base.png
#  activate :favicon_maker

  # Enable cache buster
  # activate :cache_buster

  # alternative to cache buster
  # activate :asset_hash

  # compress all the things
  # activate :gzip

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

# ftp deployment configuration. 
# activate :deploy do |deploy|
#   deploy.method = :ftp
#   deploy.host = "ftp-host"
#   deploy.user = "ftp-user"
#   deploy.password = "ftp-password"
#   deploy.path = "ftp-path"
# end
