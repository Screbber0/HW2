#include <string.h>
#include <stdio.h>
#include <stdbool.h>

struct pair {
    size_t len_word;
    char word[100];
    size_t counter;
};

void addToPairs(struct pair *pair_array, size_t *pairs_array_len, const char *char_line, size_t temp_string_len) {
    for (int i = 0; i < *pairs_array_len; ++i) {
        if (pair_array[i].len_word == temp_string_len) {
            // должны сравнить сами слова
            for (int j = 0; j < temp_string_len; ++j) {
                if (pair_array[i].word[j] != char_line[j]) {
                    break;
                }
                if (j == temp_string_len - 1) {
                    ++pair_array[i].counter;
                    return;
                }
            }
        }
    }
    for (int i = 0; i < temp_string_len; ++i) {
        pair_array[*pairs_array_len].word[i] = char_line[i];
    }
    pair_array[*pairs_array_len].len_word = temp_string_len;
    pair_array[*pairs_array_len].counter = 1;
    *pairs_array_len = *pairs_array_len + 1;
}

void printPairs(struct pair *pairs_array, size_t pairs_array_len) {
    for (int i = 0; i < pairs_array_len; ++i) {
        for (int j = 0; j < pairs_array[i].len_word; ++j) {
            printf("%c", pairs_array[i].word[j]);
        }
        printf("%c", ' ');
        printf("%ld \n", pairs_array[i].counter);
    }
}

void createDictionary(char *char_line) {
    struct pair pairs_array[50];
    size_t pairs_array_len = 0;
    size_t str_length = strlen(char_line);
    bool is_start_with_letter = true;
    char temp_string[100];
    size_t temp_string_len = 0;
    for (int i = 0; i < str_length; ++i) {
        if (!(char_line[i] >= 48 && char_line[i] <= 57)
            && !(char_line[i] >= 65 && char_line[i] <= 90)
            && !(char_line[i] >= 97 && char_line[i] <= 122)) {
            // Должны загрузить в пары слово и его кол-во
            if (temp_string_len != 0) {
                addToPairs(pairs_array, &pairs_array_len, temp_string, temp_string_len);
            }
            is_start_with_letter = true;
            temp_string_len = 0;
        } else if (temp_string_len == 0 && (char_line[i] >= 48 && char_line[i] <= 57)) {
            is_start_with_letter = false;
        } else {
            if (is_start_with_letter) {
                temp_string[temp_string_len++] = char_line[i];
            }
        }
    }
    printPairs(pairs_array, pairs_array_len);
}

int main() {
    char str[1000];
    fgets(str, 1000, stdin);
    createDictionary(str);

}
