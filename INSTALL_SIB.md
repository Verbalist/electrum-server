# Разворачивание electrum-server и кошелька electrum 

1. Создать пользователя `sibcoin`
2. Установить сибноду, поставить git (смотреть в `HOWTO.md`)
3. `git clone https://github.com/Verbalist/electrum-server.git`
4. `cd electrum-server`
5. `git branch new_develop`    
6. Скопировать `electrum_sib.conf.sample` в `/etc/electrum.conf` и помень настройки в соответствии с коментьариями
7. Запустить sibcoind
8. Запустить `python run_electrum_server.py`, начнется индексация блоков (если перезапускать то надо удалить всё из папки [leveldb].path)
9. `git clone https://github.com/Verbalist/electrum.git`
10. `cd electrum`
11. Совет по установке находится в `README.md`
12. Запустить `./electrum` нужен python3.5+
13. Выьрать сервер localhost (можно потом правый нижний угол нажать на кружок в 3 вкладке ПКМ по localhost -> выбрать сервер)
