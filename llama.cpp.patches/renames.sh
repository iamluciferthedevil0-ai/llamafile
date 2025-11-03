#!/usr/bin/env bash
# Run from repo root. Stops on first error.
set -euo pipefail

# Ensure all destination directories exist
mkdir -p .
mkdir -p imatrix
mkdir -p llama-bench
mkdir -p llava
mkdir -p main
mkdir -p perplexity
mkdir -p quantize
mkdir -p server

# Renames (git mv keeps history). If a source is already gone, skip.
gmv() { if [ -e "$1" ]; then git mv -f "$1" "$2"; fi; }

gmv common/base64.hpp base64.h
gmv common/common.cpp common.cpp
gmv common/common.h common.h
gmv common/console.h console.h
gmv common/grammar-parser.cpp grammar-parser.cpp
gmv common/grammar-parser.h grammar-parser.h
gmv common/json-schema-to-grammar.cpp json-schema-to-grammar.cpp
gmv common/json-schema-to-grammar.h json-schema-to-grammar.h
gmv common/json.hpp json.h
gmv common/log.h log.h
gmv common/ngram-cache.cpp ngram-cache.cpp
gmv common/ngram-cache.h ngram-cache.h
gmv common/sampling.cpp sampling.cpp
gmv common/sampling.h sampling.h

mkdir -p imatrix
gmv examples/imatrix/imatrix.cpp imatrix/imatrix.cpp

mkdir -p llama-bench
gmv examples/main/README.md llama-bench/README.md
gmv examples/llama-bench/llama-bench.cpp llama-bench/llama-bench.cpp

mkdir -p main
gmv examples/main/main.cpp main/main.cpp

mkdir -p perplexity
gmv examples/perplexity/perplexity.cpp perplexity/perplexity.cpp

mkdir -p quantize
gmv examples/quantize/quantize.cpp quantize/quantize.cpp

mkdir -p llava
gmv examples/llava/clip.cpp llava/clip.cpp
gmv examples/llava/clip.h llava/clip.h
gmv examples/llava/convert_image_encoder_to_gguf.py llava/convert-image-encoder-to-gguf.py
gmv examples/llava/llava-cli.cpp llava/llava-cli.cpp
gmv examples/llava/llava_surgery.py llava/llava-surgery.py
gmv examples/llava/llava.cpp llava/llava.cpp
gmv examples/llava/llava.h llava/llava.h

mkdir -p server/public server/themes server
gmv examples/server/chat-llama2.sh server/chat-llama2.sh
gmv examples/server/chat.mjs server/chat.mjs
gmv examples/server/chat.sh server/chat.sh
gmv examples/server/deps.sh server/deps.sh
gmv examples/server/httplib.h server/httplib.h
gmv examples/server/public/completion.js server/public/completion.js
gmv examples/server/themes/buttons-top/index.html server/public/index.html

gmv examples/llama.android/README.md server/public/history-template.txt
gmv examples/llama.android/llama/consumer-rules.pro server/public/prompt-template.txt

gmv ggml/src/ggml-aarch64.c ggml-aarch64.c
gmv ggml/src/ggml-aarch64.h ggml-aarch64.h
gmv ggml/src/ggml-alloc.c ggml-alloc.c
gmv ggml/include/ggml-alloc.h ggml-alloc.h
gmv ggml/src/ggml-backend-impl.h ggml-backend-impl.h
gmv ggml/src/ggml-backend.c ggml-backend.c
gmv ggml/include/ggml-backend.h ggml-backend.h
gmv ggml/src/ggml-common.h ggml-common.h
gmv ggml/include/ggml-cuda.h ggml-cuda.h
gmv ggml/src/ggml-impl.h ggml-impl.h
gmv ggml/include/ggml-metal.h ggml-metal.h
gmv ggml/src/ggml-metal.m ggml-metal.m
gmv ggml/src/ggml-metal.metal ggml-metal.metal
gmv ggml/src/ggml-quants.h ggml-quants.h
gmv ggml/src/ggml-quants.c ggml-quants.inc
gmv ggml/src/ggml.c ggml.c
gmv ggml/include/ggml.h ggml.h

gmv src/llama-grammar.cpp llama-grammar.cpp
gmv src/llama-grammar.h llama-grammar.h
gmv src/llama-impl.h llama-impl.h
gmv src/llama-sampling.cpp llama-sampling.cpp
gmv src/llama-sampling.h llama-sampling.h
gmv src/llama-vocab.cpp llama-vocab.cpp
gmv src/llama-vocab.h llama-vocab.h
gmv src/llama.cpp llama.cpp
gmv include/llama.h llama.h
gmv src/unicode-data.cpp unicode-data.cpp
gmv src/unicode-data.h unicode-data.h
gmv src/unicode.cpp unicode.cpp
gmv src/unicode.h unicode.h

echo "Renames completed. Review with: git status"
