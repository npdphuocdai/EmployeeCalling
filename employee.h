#ifndef EMPLOYEE_H
#define EMPLOYEE_H

#include <QString>

class Employee
{
public:
    Employee();
    explicit Employee(const QString &name , const QString &image, QString &designation, const QString &phone);


    const QString &name() const;
    void setName(const QString &newName);

    const QString &image() const;
    void setImage(const QString &newImage);

    const QString &phone() const;
    void setPhone(const QString &newPhone);

    const QString &designation() const;
    void setDesignation(const QString &newDesignation);

private:
    QString m_name;
    QString m_image;
    QString m_phone;
    QString m_designation;

};

#endif // EMPLOYEE_H
