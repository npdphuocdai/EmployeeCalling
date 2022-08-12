#ifndef EMPLOYEEMODEL_H
#define EMPLOYEEMODEL_H

#include "employee.h"
#include <QAbstractListModel>
#include <adapter.h>

class EmployeeModel : public QAbstractListModel
{
    Q_OBJECT;
public:
    EmployeeModel(QObject *parent = nullptr);

    enum EmployeeEnum{
        NameRole,
        ImageRole,
        DesignationRole,
        PhoneRole
    };
    int rowCount(const QModelIndex &parent = QModelIndex() ) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    void setAdapter(const Adapter &newAdapter);

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<Employee> m_employees;
    Adapter m_adapter;
};

#endif // EMPLOYEEMODEL_H
