# Be sure to restart your server when you modify this file.

Kong::Application.config.session_store :cookie_store, key: '_kong_session'
