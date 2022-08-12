#include "employee.h"

Employee::Employee()
{

}

Employee::Employee(const QString &name, const QString &image, QString &designation, const QString &phone)
{
    m_name = name;
    m_image = image;
    m_designation = designation;
    m_phone = phone;
}

const QString &Employee::name() const
{
    return m_name;
}

void Employee::setName(const QString &newName)
{
    m_name = newName;
}

const QString &Employee::image() const
{
    return m_image;
}

void Employee::setImage(const QString &newImage)
{
    m_image = newImage;
}

const QString &Employee::phone() const
{
    return m_phone;
}

void Employee::setPhone(const QString &newPhone)
{
    m_phone = newPhone;
}

const QString &Employee::designation() const
{
    return m_designation;
}

void Employee::setDesignation(const QString &newDesignation)
{
    m_designation = newDesignation;
}
