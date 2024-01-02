#include "timer.h"
#include <algorithm>
#include <QDate>
#include <QDateTime>

Timer::Timer(QObject *parent)
    : QObject{parent}
{

}

void Timer::start()
{
    m_timer.setInterval( 1000 );
    time = 31;
    paused = 0;
    update();
    m_timer.start();
}

void Timer::update()
{
    qDebug() << "Update " << time;
    int newTime = time;
    if ( paused ) {
        qDebug() << "\nPAUSED\n";
        return;
    }
    if ( newTime )
        newTime --, time --;
    m_timer.setInterval( 1000 );
    QString qs = QString::number( newTime );
    if ( newTime < 10 )
        qs = "0" + qs;
    emit timeChanged( qs );
    if ( !time )
        m_timer.stop();
}

void Timer::pause()
{
    if ( !paused ) {
        paused = 1;
        m_timer.stop();
    }
    else {
        paused = 0;
        m_timer.setInterval(1000);
        update();
        m_timer.start();
    }
}


