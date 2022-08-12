#ifndef ADAPTER_H
#define ADAPTER_H

#include <QString>

class Adapter
{
public:
    Adapter();

    const QString &getDataSource() const;
    void setDataSource(const QString &newDataSource);

    int dataSourceType();
    int type() const;
    void setType(int newType);
private:
    QString m_dataSource;
    int m_type;
};

#endif // ADAPTER_H
