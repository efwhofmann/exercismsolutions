#ifndef RUN_LENGTH_ENCODING_H
#define RUN_LENGTH_ENCODING_H

void output_term(char, int, char*);
char *encode(const char *text);
char *decode(const char *data);

#endif
