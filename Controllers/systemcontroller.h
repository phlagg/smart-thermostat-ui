#ifndef SYSTEMCONTROLLER_H
#define SYSTEMCONTROLLER_H

#include <QObject>

class SystemController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int currentSystemTemperature READ currentSystemTemperature WRITE setCurrentSystemTemperature NOTIFY currentSystemTemperatureChanged)
    Q_PROPERTY(int targetTemp READ targetTemp WRITE setTargetTemp NOTIFY targetTempChanged)
    Q_PROPERTY(QString systemStatusMessage READ systemStatusMessage WRITE setSystemStatusMessage NOTIFY systemStatusMessageChanged)
    Q_PROPERTY(HeatSelectState systemState READ systemState WRITE setSystemState NOTIFY systemStateChanged)
public:
    explicit SystemController(QObject *parent = nullptr);

    enum HeatSelectState {
        HEATING,
        COOLING,
        AUTO
    };
    Q_ENUM(HeatSelectState)

    int currentSystemTemperature() const;

    int targetTemp() const;

    QString systemStatusMessage() const;

    HeatSelectState systemState() const;

public slots:
    void setCurrentSystemTemperature(int newCurrentSystemTemperature);

    void setTargetTemp(int newTargetTemp);

    void setSystemStatusMessage(const QString& newSystemStatusMessage);

    void setSystemState(HeatSelectState newSystemState);

signals:

    void currentSystemTemperatureChanged();
    void targetTempChanged();

    void systemStatusMessageChanged();

    void systemStateChanged();

private:
    int m_currentSystemTemperature;
    int m_targetTemp;
    QString m_systemStatusMessage;
    HeatSelectState m_systemState;
    void checkSystemStatus();
};

#endif // SYSTEMCONTROLLER_H
