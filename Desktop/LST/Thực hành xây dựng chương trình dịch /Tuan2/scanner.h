/* Scanner
 * @copyright (c) 2008, Hedspi, Hanoi University of Technology
 * @author Huu-Duc Nguyen
 * @version 1.0
 */

#ifndef __SCANNER_H__
#define __SCANNER_H__
#define MAX_IDENT_LEN 15

#include "token.h"

Token* getToken(void);
Token* getValidToken(void);
void printToken(Token *token);

#endif