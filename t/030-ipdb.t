use Test::Nginx::Socket 'no_plan';

use Cwd qw(cwd);
repeat_each(5);

$ENV{TEST_NGINX_CWD} = cwd();
$ENV{WORKDIR} = "/usr/local/openresty/nginx/";
$ENV{LUA_PATH} = ";$ENV{WORKDIR}/../lualib/?.lua;$ENV{WORKDIR}/?.lua;$ENV{WORKDIR}/?.ipdb;";
$ENV{LUA_CPATH} = ";/usr/local/openresty/nginx/lualib/?.so;";

run_tests();

__DATA__

=== TEST 1: ipip test
This is just a simple demonstration of the
echo directive provided by ngx_http_echo_module.
--- main_config
--- http_config
    lua_package_path    "/usr/local/openresty/lualib/?.lua;/usr/local/openresty/nginx/?.lua;";
    lua_package_cpath   "/usr/local/openresty/lualib/?.so;";
--- config
        location /ipip {
            content_by_lua_file "../../lua/init/content.lua";
        }
--- request
GET /ipip?ip=123.125.114.144
--- response_headers_like
--- response_body_like
.*ok.*data.*
--- error_code: 200
