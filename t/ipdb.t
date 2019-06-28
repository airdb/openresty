use Test::Nginx::Socket 'no_plan';

run_tests();

__DATA__

=== TEST 1: hello, world
This is just a simple demonstration of the
echo directive provided by ngx_http_echo_module.
--- config
location = /t {
    echo "hello, world!";
}
--- request
GET /t
--- response_body
hello, world!
--- error_code: 200

=== TEST 2: ipip
--- config
location = /t {
    content_by_lua_file 'lua/init/content.lua';
}
--- request
GET /t?ip=123.125.114.144
--- response_body
GET
--- error_code: 200
