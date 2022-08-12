#ifndef ADAPTER_H
#define ADAPTER_H

#include <QString>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QList>
#include <QFile>
#include <QDebug>
#include <QDir>

#include <QtSql>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlDriver>
#include <QSqlError>

#include <employee.h>

class Adapter
{
public:
    Adapter();


    QByteArray initDataSource();
    void convertFromJson(const QByteArray &file);
    void convertFromSQLite();
    void convertFromFile(const QByteArray &file);

    const QList<Employee> &employees() const;

    const QString &dataSource() const;
    void setDataSource(const QString &newDataSource);

private:
    QString m_dataSource;
    QList<Employee> m_employee;
};

#endif // ADAPTER_H
