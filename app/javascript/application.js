// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import 'bootstrap'
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false
import "jquery"
import "controllers"
import "./custom/preview_post_image"
import "./custom/preview_image"


