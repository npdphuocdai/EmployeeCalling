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
    if(!index.isValid())
        return QVariant();

    const Employee &item = m_employees[index.row()];

    switch(role){
    case NameRole:
        return item.name();
    case PhoneRole:
        return item.phone();
    case ImageRole:
        return item.image();
    case DesignationRole:
        return item.designation();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> EmployeeModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[ImageRole] = "src";
    roles[PhoneRole] = "phone";
    roles[DesignationRole] = "des";

    return roles;
}

void EmployeeModel::setAdapter(const Adapter &newAdapter)
{
    m_adapter = newAdapter;
    beginResetModel();
    m_employees = newAdapter.employees();
    endResetModel();
}

