use Test::Nginx::Socket 'no_plan';

use Cwd qw(cwd);
repeat_each(5);

$ENV{TEST_NGINX_CWD} = cwd();
$ENV{LUA_PATH} = ";$ENV{TEST_NGINX_CWD}/../lualib/?.lua;$ENV{TEST_NGINX_CWD}/?.lua;$ENV{TEST_NGINX_CWD}/?.ipdb";
$ENV{LUA_CPATH} = ";$ENV{TEST_NGINX_CWD}/../lualib/?.so;";

run_tests();

__DATA__

=== TEST 1: ipip test
This is just a simple demonstration of the
echo directive provided by ngx_http_echo_module.
--- http_config
    lua_package_path    "$ENV{LUA_PATH}";
    lua_package_cpath   "$ENV{LUA_CPATH}";
--- config
        location /ipip {
            content_by_lua_file "../../lua/init/content.lua";
        }
--- request
GET /ipip?ip=123.125.114.144
--- response_body
GET
--- error_code: 200
