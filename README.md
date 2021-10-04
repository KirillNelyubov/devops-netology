# devops-netology
# Kirill Nelyubov

Ответы на задание к занятию «2.4. Инструменты Git»:

1. commit aefead2207ef7e2aa5dc81a34aedf0cad4c32545 "Update CHANGELOG.md" (git show aefea).
2. tag: v0.12.23 (git show 85024d3).
3. 2 родителя: 56cd7859e05c36c06b56d013b55a252d0bb7e158 и 9ea88f22fc6269854151c571162c5bcf958bee2b (git show b8d720^1 и git show b8d720^2).
4. b14b74c49 "[Website] vmc provider links", 3f235065b "Update CHANGELOG.md", 6ae64e247 "registry: Fix panic when server is unreachable", 5c619ca1b "website: Remove links to the getting started guide's old location", 06275647e "Update CHANGELOG.md", d5f9411f5 "command: Fix bug when using terraform login on Windows", 4b6d06cc5 "Update CHANGELOG.md", dd01a3507 "Update CHANGELOG.md", 225466bc3 "Cleanup after v0.12.23 release" (git log --oneline v0.12.23..v0.12.24).
5. 8c928e835 "main: Consult local directories as potential mirrors of providers" (git log -S"func providerSource(" --oneline).
6. 78b122055, 52dbf9483, 41ab0aef7, 66ebff90c, 8364383c3 (git grep "func globalPluginDirs(", git log -L:globalPluginDirs:plugins.go).
7. Martin Atkins <mart@degeneration.co.uk> (git log -S"func synchronizedWriters(").

