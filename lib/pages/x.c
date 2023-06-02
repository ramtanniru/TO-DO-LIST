#include <stdio.h>
#include <stdlib.h>

#define MAX_FRAMES 10 // maximum number of frames
#define MAX_PAGES 50 // maximum number of pages

int main() {
    int n, m, i, j, k, page_faults = 0, max_future_dist, max_future_dist_index, page_to_replace;
    int reference_string[MAX_PAGES], frames[MAX_FRAMES], future_dist[MAX_FRAMES];

    printf("Enter the number of pages: ");
    scanf("%d", &n);

    printf("Enter the reference string: ");
    for (i = 0; i < n; i++) {
        scanf("%d", &reference_string[i]);
    }

    printf("Enter the number of frames: ");
    scanf("%d", &m);

    for (i = 0; i < m; i++) {
        frames[i] = -1; // initialize all frames to -1 (empty)
    }

    for (i = 0; i < n; i++) {
        // check if page is already in a frame
        int page_found = 0;
        for (j = 0; j < m; j++) {
            if (frames[j] == reference_string[i]) {
                page_found = 1;
                break;
            }
        }

        if (!page_found) { // page fault occurred
            if (i < m) { // if there are still empty frames
                frames[i] = reference_string[i];
            } else { // replace the page with the longest future distance
                page_to_replace = -1;
                for (j = 0; j < m; j++) {
                    max_future_dist = 0;
                    for (k = i + 1; k < n; k++) {
                        if (frames[j] == reference_string[k]) {
                            future_dist[j] = k - i;
                            break;
                        } else {
                            future_dist[j] = n + 1; // if page is not found, set future distance to a high value
                        }
                    }
                    if (future_dist[j] > max_future_dist) {
                        max_future_dist = future_dist[j];
                        max_future_dist_index = j;
                    }
                }
                page_to_replace = frames[max_future_dist_index];
                frames[max_future_dist_index] = reference_string[i];
            }
            page_faults++;
        }

        printf("Page %d: ", reference_string[i]);
        for (j = 0; j < m; j++) {
            if (frames[j] == -1) {
                printf(" ");
            } else {
                printf("%d", frames[j]);
            }
            printf("\t");
        }
        if (!page_found) {
            printf("F"); // indicate page fault
        }
        printf("\n");
    }

    printf("Total page faults: %d\n", page_faults);

    return 0;
}
