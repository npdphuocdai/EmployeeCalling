#include "adapter.h"

Adapter::Adapter()
    :m_dataSource(""), m_type(0)
{

}

const QString &Adapter::getDataSource() const
{
    return m_dataSource;
}

void Adapter::setDataSource(const QString &newDataSource)
{
    m_dataSource = newDataSource;
}

// Depends on data source that return related type
int Adapter::dataSourceType()
{
    if(m_dataSource == "txt")
        m_type = 1;
    else if(m_dataSource == "SQLite")
        m_type = 2;
    else if(m_dataSource == "JSON")
        m_type = 3;
    return m_type;
}

int Adapter::type() const
{
    return m_type;
}

void Adapter::setType(int newType)
{
    m_type = newType;
}

