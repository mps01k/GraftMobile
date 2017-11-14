#ifndef GRAFTPOSCLIENT_H
#define GRAFTPOSCLIENT_H

#include "graftbaseclient.h"
#include <QVariant>

class SelectedProductProxyModel;
class QRCodeGenerator;
class ProductModel;
class GraftPOSAPI;

class GraftPOSClient : public GraftBaseClient
{
    Q_OBJECT
public:
    explicit GraftPOSClient(QObject *parent = nullptr);
    ~GraftPOSClient();

    ProductModel *productModel() const;
    SelectedProductProxyModel *selectedProductModel() const;

    void registerTypes(QQmlEngine *engine) override;
    Q_INVOKABLE bool resetUrl(const QString &ip, const QString &port) override;

signals:
    void saleReceived(bool result);
    void rejectSaleReceived(bool result);
    void saleStatusReceived(bool result);

public slots:
    void save();
    void sale();
    void rejectSale();
    void getSaleStatus();

private slots:
    void receiveSale(int result);
    void receiveRejectSale(int result);
    void receiveSaleStatus(int result, int saleStatus);

private:
    void initProductModels();

    GraftPOSAPI *mApi;
    QRCodeGenerator *mQRCodeEncoder;
    QString mPID;
    ProductModel *mProductModel;
    SelectedProductProxyModel *mSelectedProductModel;
};

#endif // GRAFTPOSCLIENT_H
