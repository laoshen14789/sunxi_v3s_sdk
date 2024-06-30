# 定义编译器
CROSS_COMPILER=arm-linux-
CC=$(CROSS_COMPILER)gcc
STRIP=$(CROSS_COMPILER)strip

# 定义头文件搜索路径
HDRFLAGS := 

# 定义编译器优化标志，这里使用-O2表示中等优化级别
OPTFLAGS :=

# 定义源文件搜索路径
VPATH := ./

# 定义源文件后缀
SRC_SUFFIX := .c

# 自动查找所有源文件
SRC := $(wildcard $(VPATH)/*$(SRC_SUFFIX))

# 对象文件由源文件生成
OBJ := $(SRC:$(VPATH)/%$(SRC_SUFFIX)=%.o)

# 目标可执行文件名
TARGET := test

# 定义需要链接的动态库列表
LIBS := 

# 定义链接器标志
LDFLAGS :=

# 编译器标志，包括调试信息和优化标志
CFLAGS := $(HDRFLAGS) $(OPTFLAGS) -g

# 默认目标
all: $(TARGET)

# 链接目标，使用LDFLAGS
$(TARGET): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS) $(LIBS)

# 从源文件生成对象文件的规则
%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# 使用strip命令移除符号信息
strip: $(TARGET)
	$(STRIP) $@

# 清理编译生成的文件
clean:
	rm -f $(OBJ) $(TARGET)

# 声明伪目标
.PHONY: all clean strip