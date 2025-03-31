#include <iostream>
#include <fstream>
#include <vector>
#include <unistd.h> 
int main() {
    std::vector<std::ofstream> files;
    size_t file_count = 0;

    while (true) {
        std::ofstream file("file_" + std::to_string(file_count) + ".txt");

        if (!file.is_open()) {
            std::cerr << "Cannot open more files! Stopping at " << file_count << " files." << std::endl;
            break;
        }

        files.push_back(std::move(file));
        file_count++;
        sleep(1);
        if (file_count % 1000 == 0) {
            std::cout << "Opened " << file_count << " files..." << std::endl;
            sleep(10);
        }
    }

    std::cout << "Total files opened: " << file_count << std::endl;
    return 0;
}
