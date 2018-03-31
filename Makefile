CC 			= gcc
LD 			= gcc

JEU = graphique
OS	= LINUX


	SRCS = Fromage.c Terrain.c Jeu.c sdlJeu.c main.c
	FINAL_TARGET = fromage_gfx
	DEFINE = -D$(OS) -DJEU_SDL

	LIBS = -lSDL -lSDL_image -lSDL_mixer



LDFLAGS  			=
CFLAGS 			= $(DEFINE)  -w -ggdb   #-O2   # pour optimiser
INCLUDE_DIR 		= -I/usr/include -Isrc  -I/usr/include/SDL 

OBJ_DIR 		= obj
SRC_DIR 		= src
BIN_DIR 		= bin



default: $(BIN_DIR)/$(FINAL_TARGET)


$(BIN_DIR)/$(FINAL_TARGET): $(SRCS:%.c=$(OBJ_DIR)/%.o)
	$(LD) $+ -o $@ $(LDFLAGS) $(LIB_DIR) $(LIBS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) -c $(CFLAGS) $(INCLUDE_DIR) $< -o $@

clean:
	rm -f $(OBJ_DIR)/*.o $(BIN_DIR)/$(FINAL_TARGET)
