##生物区系图（最终版）
install.packages("plotbiomes")
# 如果没有devtools或remotes，先安装它们
install.packages("devtools")  # 或
install.packages("remotes")

# 从GitHub安装plotbiomes
devtools::install_github("valentinitnelav/plotbiomes")


###代码
library(plotbiomes)
library(ggplot2)
library(readr)

# 读取 CSV 数据
my_data <- read_csv("data_for_biomes_.csv")  
# 使用 read_csv() 或 read.csv() 导入你的 CSV 数据

# 生成 Whittaker 生物群系底图
p <- whittaker_base_plot()

# 叠加 CSV 数据点
p + geom_point(data = my_data, 
               aes(x = Temperature, y = Precipitation/10), # 映射 CSV 数据中的列
               color = "black", shape = 1, size = 3, alpha = 0.6) + # 点的颜色、大小和透明度、shape表示点的格式
  labs(title = "Whittaker Biome Diagram with Your Observations") + # 修改标题
  theme(
    plot.title = element_text(
      hjust = 0.5,        # 水平居中 (0=左, 0.5=中, 1=右)
      vjust = 0.5,        # 垂直居中 (0=底, 0.5=中, 1=顶)
      size = 16,          # 字体大小
      face = "bold",      # 粗体
      margin = margin(b = 20)  # 底部留白(可选)
    )
  )



#####终稿
# ---- Step 1：加载必要包 ----
install.packages("plotbiomes")     # 如未安装请取消注释
install.packages("ggplot2")
library(plotbiomes)
library(ggplot2)
# ---- Step 2：读取你的数据 ----
data <- read.csv("data_for_biomes.csv")  # 请确保路径正确
colnames(data) <- c("temp", "precip")    # 重命名方便使用
# ---- Step 3：绘制基础 Whittaker 图并设置字体 ----
base_plot <- whittaker_base_plot() +
  theme(
    text = element_text(family = "STHeiti"),     # Mac 下避免乱码的字体
    axis.text = element_text(family = "STHeiti"),
    legend.text = element_text(family = "STHeiti"),
    plot.title = element_text(family = "STHeiti")
  )

# ---- Step 4：叠加你的点数据 ----
final_plot <- base_plot +
  geom_point(data = data, aes(x = temp, y = precip/10),
             color = "black", shape = 1, size = 3, alpha = 0.6)
# ---- Step 5：显示图形 ----
print(final_plot)
# ---- Step 6：导出为 PDF 格式 ----
ggsave("biome_map.pdf", plot = final_plot, width = 8, height = 6, units = "in")
# ---- 可选：保存为 PDF 避免显示乱码 ----
# ggsave("whittaker_biome_with_points.pdf", final_plot, width = 8, height = 6)