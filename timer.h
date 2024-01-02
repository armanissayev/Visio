#ifndef TIMER_H
#define TIMER_H

#include <QDate>
#include <QObject>
#include <QTime>
#include <QTimer>
#include <QSettings>

class Timer : public QObject
{
    Q_OBJECT
public:
    explicit Timer(QObject *parent = nullptr);
    int time;
    bool paused;
    int curent_time;
    QTimer m_timer;

signals:
    void timeChanged( QString newTime );

public slots:
    void start();
    void update( );
    void pause();

};

#endif // APPENGINE_H
