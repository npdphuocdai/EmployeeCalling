#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>
#include <QFile>
#include <QDomDocument>
#include <QDomElement>
#include <employeemodel.h>
#include <adapter.h>
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

//    QFile file(":/data.json");
//    file.open(QIODevice::ReadOnly | QIODevice::Text);
//    QByteArray byteArr = file.readAll();
//    file.close();
    //read xml file
    QDomDocument appXML;
    QFile xmlFile(":/Application.xml");
    if (!xmlFile.open(QIODevice::ReadOnly ))
    {
        // Error while loading file
    }
    appXML.setContent(&xmlFile);
    xmlFile.close();

    QDomElement root = appXML.documentElement();
    QDomElement node = root.firstChild().toElement();

    QString data = "";

    while(node.isNull() == false)
    {
        if(node.tagName() == "DataSource"){
            while(!node.isNull()){
                QString name = node.attribute("name","name");

                data.append(name);
                node = node.nextSibling().toElement();
            }
        }
        node = node.nextSibling().toElement();
    }

    Adapter adapter;
    adapter.setDataSource(data);

    EmployeeModel empModel;
    empModel.setAdapter(adapter);

    QQmlContext *rootCtx = engine.rootContext();
//    rootCtx->setContextProperty("_JsonModel",byteArr);
    rootCtx->setContextProperty("_model",&empModel);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
