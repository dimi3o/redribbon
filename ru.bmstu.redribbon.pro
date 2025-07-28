TARGET = ru.bmstu.redribbon

CONFIG += \
    auroraapp

DEPLOYMENT_PATH = /usr/share/$${TARGET}

data.files = data
data.path = $${DEPLOYMENT_PATH}

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

INSTALLS += data

HEADERS += \

DISTFILES += \
    data/bmstu.png \
    data/omp.png \
    data/aur.png \
    data/aurora.mp4 \
    data/cutting.wav \
    data/fanfare.wav \
    data/applause.wav \
    data/push.wav \
    data/push2.wav \
    data/fine1.wav \
    data/fine2.wav \
    data/firework.mp4 \
    data/high.wav \
    data/intro.wav \
    data/intro2.wav \
    data/low.wav \
    data/snow.mp4 \
    data/flowers.mp4 \
    data/firework.mp4 \
    data/redribbon.mp4 \
    data/redribbon2.mp4 \
    qml/pages/KeyRed.qml \
    qml/pages/RedRibbonCut.qml \
    rpm/ru.bmstu.redribbon.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/ru.bmstu.redribbon.ts \
    translations/ru.bmstu.redribbon-ru.ts \
