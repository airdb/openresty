use Test::Nginx::Socket 'no_plan';

use Cwd qw(cwd);
repeat_each(5);

$ENV{TEST_NGINX_CWD} = cwd();
$ENV{LUA_PATH} = ";$ENV{TEST_NGINX_CWD}/../lualib/?.lua;$ENV{TEST_NGINX_CWD}/?.lua;$ENV{TEST_NGINX_CWD}/?.ipdb";
$ENV{LUA_CPATH} = ";$ENV{TEST_NGINX_CWD}/../lualib/?.so;";

run_tests();

__DATA__

=== TEST 1: hello, world
This is just a simple demonstration of the
echo directive provided by ngx_http_echo_module.
--- http_config
    lua_package_path    "$ENV{LUA_PATH}";
    lua_package_cpath   "$ENV{LUA_CPATH}";
    init_by_lua_block {
        print("init")
    }
--- config
        location /t {
            echo "hello, world!";
        }
--- request
GET /t
--- response_body
hello, world!
--- error_code: 200
