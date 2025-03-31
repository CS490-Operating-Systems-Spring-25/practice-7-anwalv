#include <iostream>
#include <fstream>
#include <vector>
#include <unistd.h>  // Для sleep()

int main() {
    std::vector<std::ofstream> files;
    int total_files = 0;
    const int batch_size = 1000;
    const int max_files = 100000;

    for (int batch = 0; batch < max_files / batch_size; ++batch) {
        for (int i = 0; i < batch_size; ++i) {
            files.emplace_back("file" + std::to_string(total_files) + ".txt");
            if (!files.back()) {
                std::cerr << "Cannot open more files! Stopping at " << total_files << " files.\n";
                return 1;
            }
            total_files++;
        }

        std::cout << "Opened " << total_files << " files so far...\n";
        sleep(1);
    }

    std::cout << "Successfully opened " << total_files << " files.\n";
    return 0;
}
