FROM alpine:3.12 AS assembler

COPY hello.asm /

RUN apk add --no-cache nasm && \
	nasm /hello.asm && \
	chmod +x /hello

FROM scratch
COPY --from=assembler /hello /hello
CMD ["/hello"]
