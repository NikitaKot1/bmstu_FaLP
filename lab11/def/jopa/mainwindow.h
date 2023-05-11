#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QGraphicsScene>

#include <QMouseEvent>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

protected:
    void mousePressEvent(QMouseEvent *event);

private slots:
    void on_pb_enter_clicked();

    void on_pb_map_clicked();

private:
    Ui::MainWindow *ui;

    int n = 1;
    int m = 1;
    QGraphicsScene* scene;

    bool portal_flag = false;
    int ptl_str_x = 0;
    int ptl_str_y = 0;

    FILE* p;
    FILE *po;
};
#endif // MAINWINDOW_H
