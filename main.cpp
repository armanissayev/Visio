#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTime>
#include <QDate>

#include "appengine.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    AppEngine ap;

    QObject::connect( &ap, &AppEngine::close, &app, &QGuiApplication::quit );

    ap.v.push_back( 10 );
    ap.v.push_back( 32 );
    ap.v.push_back( 18 );

    engine.rootContext()->setContextProperty( "app", &ap );

    engine.loadFromModule("Visio", "Main");

    return app.exec();
}
