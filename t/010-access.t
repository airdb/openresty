use Test::Nginx::Socket 'no_plan';

use Cwd qw(cwd);
repeat_each(5);

run_tests();

__DATA__

=== TEST 1: header test
This is just a simple demonstration of the
echo directive provided by ngx_http_echo_module.
--- main_config
--- http_config
    lua_package_path    "/usr/local/openresty/lualib/?.lua;/usr/local/openresty/nginx/?.lua;";
    lua_package_cpath   "/usr/local/openresty/lualib/?.so;";
    access_by_lua_file "../../lua/init/access.lua";
--- config
        location /header {
            content_by_lua_file "../../lua/init/content.lua";
        }
--- request
HEAD /header
--- response_headers_like
Server: AGW
--- error_code: 200
