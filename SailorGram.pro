TEMPLATE = subdirs

webp-plugin.file = webp-plugin/webp.pro
libqtelegram-ae.file = libqtelegram-aseman-edition/libqtelegram-ae.pro
telegramqml.file = TelegramQML/telegramqml.pro

harbour-sailorgram.depends = webp-plugin libqtelegram-ae telegramqml

SUBDIRS += webp-plugin libqtelegram-ae telegramqml harbour-sailorgram
