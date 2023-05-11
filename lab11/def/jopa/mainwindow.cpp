#include "mainwindow.h"
#include "./ui_mainwindow.h"

#include <iostream>
#include <string>
#include <cstdlib>
#include <vector>
#include <fstream>

using namespace std;


vector<int> getNumbersFromString(string str) {
    vector<int> numbers;
    int num = 0;
    string tempStr = "";

    for (int i = 0; i < str.length(); i++) {
        char c = str[i];

        if (isdigit(c)) {
            tempStr += c;
        } else if (tempStr != "") {
            num = stoi(tempStr);
            numbers.push_back(num);
            tempStr = "";
        }
    }

    if (tempStr != "") {
        num = stoi(tempStr);
        numbers.push_back(num);
    }

    return numbers;
}


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    scene = new QGraphicsScene;
    scene->setSceneRect(0, 0, ui->grap->width() - 1, ui->grap->height() - 1);
    ui->grap->setScene(scene);

    p = popen("swipl -s ../jopa/def2.pl", "w");
    po = popen("swipl -s ../jopa/def2.pl", "r");
    setbuf(stdout, NULL);
}

MainWindow::~MainWindow()
{
    pclose(p);
    delete ui;
}


void MainWindow::on_pb_enter_clicked()
{
    scene->clear();
    n = ui->sb_n->value();
    m = ui->sb_m->value();
    if (n >= 1 && m >= 1)
    {
        double width = double(ui->grap->width()) / n - 1;
        double height = double(ui->grap->height()) / m - 1;
        for (int i = 0; i < n; i++)
        {
            scene->addLine(width * i, 0, width * i, ui->grap->height() - 2);
        }

        for (int i = 0; i < m; i++)
        {
            scene->addLine(0, height * i, ui->grap->width() - 2, height * i);
        }
    }


    pclose(p);
    p = popen("swipl -s ../jopa/def2.pl", "w");
}

void MainWindow::mousePressEvent(QMouseEvent *event)
{
    int x = event->x() - ui->grap->x();
    int y = event->y() - ui->grap->y();

    if (x < 0 || x >= ui->grap->width() || y < 0 || y >= ui->grap->height())
        return;

    int width = ui->grap->width() / n - 1;
    int height = ui->grap->height() / m - 1;

    int ix = x / width;
    int iy = y / height;

    std::cout << ix << " " << iy << "\n";

    if (ui->rb_wall->isChecked())
    {
        fprintf(p, "assert(low_wall((%d, %d))).\n", ix, iy);
        fflush(p);

        scene->addRect(ix * width, iy * height, width, height, QPen(Qt::black), QBrush(Qt::gray));
    }
    else if (ui->rb_hwall->isChecked())
    {
        fprintf(p, "assert(high_wall((%d, %d))).\n", ix, iy);
        fflush(p);

        scene->addRect(ix * width, iy * height, width, height, QPen(Qt::black), QBrush(Qt::black));
    }
    else if (ui->rb_portal->isChecked())
    {
        if (portal_flag) {
            scene->addRect(ix * width, iy * height, width, height, QPen(Qt::black), QBrush(Qt::blue));

            fprintf(p, "assert(portal((%d, %d), (%d, %d))).\n", ptl_str_x, ptl_str_y, ix, iy);
            fflush(p);
        }
        else {
            ptl_str_y = iy;
            ptl_str_x = ix;
            scene->addRect(ix * width, iy * height, width, height, QPen(Qt::black), QBrush(Qt::green));
        }
        portal_flag = !portal_flag;
    }
    else if (ui->rb_trap->isChecked())
    {
        scene->addRect(ix * width, iy * height, width, height, QPen(Qt::black), QBrush(Qt::red));

        fprintf(p, "assert(trap_r((%d, %d), %d)).\n", ix, iy, ui->sb_trap->value());
        fflush(p);
    }
}



void MainWindow::on_pb_map_clicked()
{
    fprintf(p, "solve_maze((0, 0), (%d, %d), Path).\nw\n", n-1, m-1);
    fflush(p);
}

