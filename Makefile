docker-run:
	@echo "========= docker build... ============"
	@docker build -t local/openresty-development .
	@echo "========= docker run... ============"
	@docker run -v $(PWD)/lua:/usr/local/openresty/nginx/lua -v $(PWD)/nginx.conf.d:/usr/local/openresty/nginx/conf.d -it -p 88:80 local/openresty-development

.PHONY: docker-run
