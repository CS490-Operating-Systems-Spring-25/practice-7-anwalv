#include <iostream>
#include <fstream>
#include <vector>
#include <unistd.h>  // Для sleep()

int main() {
    std::vector<std::ofstream> files;
    int i = 0;

    while (true) {
        files.emplace_back("file" + std::to_string(i) + ".txt");
        if (!files.back()) {
            std::cout << "Cannot open more files! Stopping at " << i << " files.\n";
            break;
        }
        std::cout << "Opened file #" << i << std::endl;
        i++;
        sleep(1);

    return 0;
}
