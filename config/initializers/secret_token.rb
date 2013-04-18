# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Kong::Application.config.secret_key_base = 'e3a433d9ce78a479574b3f620a6ad65a26d5fac3f5abb03f5488c32ba2808f5b3d140ae67dcb68338dabe2694d2c23c188ffb32d337285fc4efab462b57ace45'
