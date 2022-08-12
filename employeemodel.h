#ifndef EMPLOYEEMODEL_H
#define EMPLOYEEMODEL_H

#include "employee.h"
#include <QAbstractListModel>
class EmployeeModel : public QAbstractListModel
{
    Q_OBJECT;
public:
    EmployeeModel(QObject *parent = nullptr);

    enum EmployeeEnum{
        NameRole,
        ImageRole,
        DesignationRole
    };
    int rowCount(const QModelIndex &parent = QModelIndex() ) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<Employee> m_employees;
};

#endif // EMPLOYEEMODEL_H
