#include "employeemodel.h"

EmployeeModel::EmployeeModel(QObject *parent)
    : QAbstractListModel{parent}
{

}

int EmployeeModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_employees.length();
}

QVariant EmployeeModel::data(const QModelIndex &index, int role) const
{
    return QVariant();
}

QHash<int, QByteArray> EmployeeModel::roleNames() const
{
    QHash<int, QByteArray> roles;

    return roles;
}

