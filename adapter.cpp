#include "adapter.h"
#include <QFile>


Adapter::Adapter()
{

}

QByteArray Adapter::initDataSource()
{
    QByteArray ini;
    QFile File;
    QByteArray bytedata;
    //Json
    if(m_dataSource == "Json"){
        File.setFileName(":/data.json");
        File.open(QIODevice::ReadOnly | QIODevice::Text);
        bytedata = File.readAll();
        ini = bytedata;

        convertFromJson(bytedata);
    }
    //SQLLite
    else if(m_dataSource == "SQLite"){
        File.setFileName(":/db/employee.sqlite");
        if(File.open(QIODevice::ReadOnly | QIODevice::Text)){
            qDebug() << "D:/Adapter.cpp: Able to open SQLite file";
        }
        convertFromSQLite();

        QByteArray bytedata = File.readAll();
        ini = bytedata;

    }
    //File
    else if(m_dataSource == "File"){
        QFile File(":/data.txt");
        File.open(QIODevice::ReadOnly | QIODevice::Text);
        QByteArray bytedata = File.readAll();
        ini = bytedata;

        convertFromFile(bytedata);
    }
    return ini;
}

void Adapter::convertFromJson(const QByteArray &file)
{
    QList<Employee> newEmps;
    QJsonDocument jsonDoc = QJsonDocument::fromJson(file);
    QJsonArray employees = jsonDoc.array();

    for(int i = 0; i < employees.size(); i++)
    {
        QJsonObject emp = employees[i].toObject();

        QString name = emp["name"].toString();
        QString image = emp["image"].toString();
        QString designation = emp["designation"].toString();
        QString phone = emp["phone"].toString();

        auto newEmp = Employee(name, image, designation, phone);
        newEmps.append(newEmp);
    }

    m_employee = newEmps;
}

void Adapter::convertFromSQLite()
{
    QList<Employee> newEmps;
    const QString path = "C:/Users/npdph/Documents/QT/EmployeeCalling/db/employee.sqlite";
    QSqlDatabase m_db = QSqlDatabase::addDatabase("QSQLITE","sqliteConnection");
    m_db.setDatabaseName(path);
    m_db.open();
    try{
        if( QSqlDatabase::contains( "sqliteConnection" ) )
        {
            QSqlDatabase db = QSqlDatabase::database( "sqliteConnection" );
            if(db.open())
            {
                qDebug() << "sql open";

                QSqlQuery q(db);

                if(q.exec("SELECT * FROM employee"))
                {
                    while(q.next())
                    {
                        QString name = q.value(0).toString();
                        QString image = q.value(1).toString();
                        QString designation = q.value(2).toString();
                        QString phone = q.value(3).toString();

                        auto newEmp = Employee(name, image, designation, phone);
                        newEmps.append(newEmp);
                    }

                    m_employee = newEmps;
                }
                else {
                    qDebug() << "D:/ Query excute error: " << q.lastError() ;
                }
            }
            else {
                qDebug() << "in if - try error: " << db.lastError();
            }
        } else {
            qDebug() << "if error: " << m_db.lastError();
        }

        m_db.close();
        QSqlDatabase::removeDatabase("sqliteConnection");
    }
    catch(QSqlError e){
        qDebug() << "catch error: " << e.nativeErrorCode() << " - type:" << e.type();
    }
}

void Adapter::convertFromFile(const QByteArray &file)
{
    QList<Employee> newEmps;
    QJsonDocument jsonDoc = QJsonDocument::fromJson(file);
    QJsonArray employees = jsonDoc.array();

    for(int i = 0; i < employees.size(); i++)
    {
        QJsonObject emp = employees[i].toObject();

        QString name = emp["name"].toString();
        QString image = emp["image"].toString();
        QString designation = emp["designation"].toString();
        QString phone = emp["phone"].toString();

        auto newEmp = Employee(name, image, designation, phone);
        newEmps.append(newEmp);
    }

    m_employee = newEmps;
}

const QList<Employee> &Adapter::employees() const
{
    return m_employee;
}

const QString &Adapter::dataSource() const
{
    return m_dataSource;
}

void Adapter::setDataSource(const QString &newDataSource)
{
    m_dataSource = newDataSource;
    initDataSource();
}
