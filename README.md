# Homebrew tap — wisecort

```bash
brew install --cask wisecort/tap/logdeck
```

| Cask | App |
|---|---|
| `logdeck` | [LogDeck](https://github.com/wisecort/LogDeck): explorador de logs de Kubernetes/OKD, somente leitura (macOS Apple Silicon e Intel). Instala o `kubectl` junto. |

Atualizar: `brew upgrade --cask logdeck`. Remover tudo, inclusive preferências: `brew uninstall --zap --cask logdeck`.

O app ainda não é notarizado pela Apple. Se o macOS bloquear a primeira abertura:

```bash
xattr -dr com.apple.quarantine /Applications/LogDeck.app
```
