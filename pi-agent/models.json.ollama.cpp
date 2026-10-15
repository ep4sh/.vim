{
  "providers": {
    "llama-cpp-developer": {
      "baseUrl": "http://localhost:9931/v1",
      "api": "openai-completions",
      "apiKey": "none",
      "models": [
        {
          "id": "ornith-ai/Ornith-1.0-9B-GGUF:Q4_K_M",
          "contextWindow": 16535
        }
      ]
    },
    "llama-cpp-architect": {
      "baseUrl": "http://localhost:9932/v1",
      "api": "openai-completions",
      "apiKey": "none",
      "models": [
        {
          "id": "LiquidAI/LFM2.5-2.6B-GGUF",
          "contextWindow": 6096
        }
      ]
    }
  }
}
