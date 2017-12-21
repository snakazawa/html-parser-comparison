#include <iostream>
#include <fstream>
#include <string>
#include <iterator>
#include <vector>
#include <sys/types.h>
#include <dirent.h>
#include <gq/Document.h>
#include <gq/Node.h>
#include "ProgressBar.hpp"

using namespace std;

int main(int argc, char * argv[])
{
    string dir_path("../data/pages/");
    DIR* dp = opendir(dir_path.c_str());

    if (dp == NULL) {
        cerr << "cannot open dir: " << dir_path << endl;
        exit(1);
    }

    vector<string> filenames;
    struct dirent* dent;
    while (true) {
        dent = readdir(dp);
        if (dent == NULL) break;

        string filename(dent->d_name);
        if (filename.find(".") == 0) continue;

        filenames.push_back(filename);
    }

    closedir(dp);

    constexpr int PROGRESSBAR_WIDTH = 70;
    ProgressBar progress_bar(filenames.size(), PROGRESSBAR_WIDTH);

    for (auto filename : filenames) {
        string path = dir_path + filename;
        ifstream ifs(path);
        if (ifs.fail()) {
            cerr << "cannot open file: " << path << endl;
            exit(1);
        }

        istreambuf_iterator<char> it(ifs);
        istreambuf_iterator<char> last;
        string text(it, last);

        CDocument doc;
        doc.parse(text.c_str());

        CSelection c = doc.find("h1");
//        CSelection c = doc.find("option");
//        if (c.nodeNum() == 0) continue;
//        cout << c.nodeAt(0).text() << std::endl;
        ++progress_bar;
        progress_bar.display();
    }

    progress_bar.done();

    return 0;
}
