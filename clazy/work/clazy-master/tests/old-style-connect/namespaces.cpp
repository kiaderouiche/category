#include <QtCore/QObject>
#include "namespaces.h" // Test that we use the most qualified name in headers

namespace Foo
{
    class MyObj2 : public QObject
    {
        Q_OBJECT
    public Q_SLOTS:
        void separateNSSlot() {};
    };
}

namespace Foo {
class MyObj : public QObject
{
    Q_OBJECT
public:

public Q_SLOTS:
    void slot1() {};
    void slot2() {};
Q_SIGNALS:
    void signal1();
};


void foo()
{
    Foo::MyObj *o1 = new Foo::MyObj();
    MyObj2 *o2;
    QObject::connect(o1, SIGNAL(signal1()), o1, SLOT(slot1())); // Warning
    QObject::connect(o1, SIGNAL(signal1()), o2, SLOT(separateNSSlot())); // Warning
}

}

void foo2()
{
    Foo::MyObj *o1;
    Foo::MyObj2 *o2;
    QObject::connect(o1, SIGNAL(signal1()), o1, SLOT(slot1())); // Warning
    QObject::connect(o1, SIGNAL(signal1()), o2, SLOT(separateNSSlot())); // Warning
}


using namespace Foo; // Comes after, so shouldn't have influence
int main() { return 0; }
#include "namespaces.moc"
