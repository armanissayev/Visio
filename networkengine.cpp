//#include "networkengine.h"

//NetworkEngine::NetworkEngine(QObject *parent)
//    : QObject(parent)
//    , m_apiKey( QString() )
//{
//    m_networkAccessM = new QNetworkAccessManager( this );
//}

//NetworkEngine::~NetworkEngine()
//{
//    m_networkAccessM->deleteLater();
//}

//void NetworkEngine::setAPIkey(const QString &apiKey)
//{
//    m_apiKey = apiKey;
//}

//void NetworkEngine::networkReplyReadyRead()
//{
//    qDebug() << m_networkReply->readAll();
//    m_networkReply->deleteLater();
//}

//void NetworkEngine::sighUserUp(const QString &email, const QString &password)
//{
//    QString signUpEndpoint = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=" + m_apiKey;
//    QVariantMap variantPayLoad;
//    variantPayLoad[ "email" ] = email;
//    variantPayLoad[ "password" ] = password;
//    variantPayLoad[ "returnSecureToken" ] = true;

//    QJsonDocument jsonPayload = QJsonDocument::fromVariant( variantPayLoad );
//    performPost( signUpEndpoint, jsonPayload );
//}

//void NetworkEngine::performPost(const QString &url, const QJsonDocument &payload)
//{
//    QNetworkRequest newRequest( QUrl( url ) );
//    newRequest.setHeader( QNetworkRequest::ContentTypeHeader, QString( "application/json" ) );
//    m_networkReply = m_networkAccessM->post( newRequest, payload.toJson() );
//    connect( m_networkReply, &QNetworkReply::readyRead, this, &NetworkEngine::networkReplyReadyRead );
//}
