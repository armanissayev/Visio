#include "appengine.h"
#include <algorithm>
#include <QDate>
#include <QDateTime>

AppEngine::AppEngine(QObject *parent)
    : QObject{parent}
{

}

int AppEngine::sz()
{
    return v.size();
}

int AppEngine::pos(int x)
{
    return v[ x ];
}

QDate AppEngine::today()
{
    QDate td;
    return td.currentDate();
}


int AppEngine::weekday( QDate td )
{
    return td.dayOfWeek();
}

QString AppEngine::dayToWeek(int x)
{
    if ( x == 1 )
        return "Mon";
    if ( x == 2 )
        return "Tue";
    if ( x == 3 )
        return "Wed";
    if ( x == 4 )
        return "Thus";
    if ( x == 5 )
        return "Fri";
    if ( x == 6 )
        return "Sat";
    if ( x == 7 )
        return "Sun";
    return "";
}

QDate AppEngine::yesterday( QDate td, int num )
{
    int d = td.day();
    int m = td.month();
    int y = td.year();
    QCalendar cal;
    if ( num > 0 ) {
        while ( num -- ) {
            d --;
            if ( !d ) {
                m --;
                if ( m ) {
                    d = cal.daysInMonth( m, y );
                }
                else {
                    y --;
                    m = 12;
                    d = 31;
                }
            }
        }
    }
    else {
        while ( num ++ ) {
            d ++;
            if ( d > cal.daysInMonth( m, y ) ) {
                d = 1;
                if ( m == 12 )
                    m = 1, y ++;
                else
                    m ++;
            }
        }
    }
    QDate tn = cal.dateFromParts( y, m , d );
    return tn;
}

int AppEngine::day(QDate td)
{
    return td.day();
}

void AppEngine::firstPageVisited()
{
    QSettings qs;
    qs.setValue( "cache/was", true );
}

bool AppEngine::isFirstPageVisited()
{
    QSettings qs;
    return qs.value( "cache/was" ).toBool();
}

bool AppEngine::isNameWritten()
{
    QSettings qs;
    return qs.value( "cache/isname" ).toBool();
}

void AppEngine::nameWritten(QString name)
{
    QSettings qs;
    qs.setValue( "cache/name", name );
    qs.setValue( "cache/isname", true );
}

QString AppEngine::takeName()
{
    QSettings qs;
    QString name = qs.value( "cache/name" ).toString();
    if (name.isEmpty()) name = QString("user");
    return name;
}



//void AppEngine::rnd()
//{
//    srand(time(0));
//    random_shuffle( v.begin(), v.end() );
//}

