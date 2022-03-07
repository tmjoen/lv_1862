import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :lv_1862, Lv1862Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "miwmmRHqPkiF80AREGzLEvVKyb9DxdQJfUxe49beRxDkyeEnx0a9cFAzU+j2Diwq",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
