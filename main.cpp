#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>
#include <QFile>
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    app.setApplicationName("EmployeeCalling");
    app.setOrganizationDomain("hclvietnam.com");
    app.setOrganizationName("HCL Technologies Vietnam");

    QQmlApplicationEngine engine;

    QFile file(":/data.json");
    file.open(QIODevice::ReadOnly | QIODevice::Text);
    QByteArray byteArr = file.readAll();
    file.close();

    QQmlContext *root = engine.rootContext();
    root->setContextProperty("_JsonModel",byteArr);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
