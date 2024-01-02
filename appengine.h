#ifndef APPENGINE_H
#define APPENGINE_H

#include <QDate>
#include <QObject>
#include <QTime>
#include <QTimer>
#include <QSettings>

class AppEngine : public QObject
{
    Q_OBJECT
public:
    explicit AppEngine(QObject *parent = nullptr);
    std::vector <int> v;

signals:
    void close();

public slots :
    int sz();
    int pos( int x );
    QDate today();
    int weekday( QDate td );
    QString dayToWeek( int x );
    QDate yesterday( QDate td, int num );
    int day( QDate td );
    void firstPageVisited();
    bool isFirstPageVisited();
    bool isNameWritten();
    void nameWritten( QString name );
    QString takeName();

};

#endif // APPENGINE_H
