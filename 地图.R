###地图（最终版本）
library(ggplot2)
library(sf)
library(rnaturalearth)
# 1. 导入数据
data_for_map <- read.csv("data_for_map.csv")
# 2. 清理数据 - 移除空行
data_for_map <- data_for_map %>% 
  filter(!is.na(longitude) & !is.na(latitude))
View(data_for_map)
# 3. 获取世界地图
world <- ne_countries(scale = "medium", returnclass = "sf")
# 4. 创建完整地图
###（无边框）
ggplot() +
  # 绘制世界地图背景（使用geom_sf）
  geom_sf(data = world, 
          fill = "lightgray",   # 国家填充色
          color = "white",      # 边界线颜色
          size = 0.2) +         # 边界线粗细
  
  # 添加采样点（使用geom_point）
  geom_point(data = data_for_map, 
             aes(x = longitude, y = latitude, 
                 color = test, shape = type),
             size = 3,          # 点大小
             alpha = 0.8) +     # 透明度
  
  # 设置颜色和形状的映射
  scale_color_manual(
    values = c("decrease only" = "#54d5c7",
               "increase only" = "#f65150",
               "decrease + increase" = "#edba38")) +
  
  scale_shape_manual(
    values = c("plant only" = 16,
               "microorgnism only" = 17,
               "plant + microorgnism" = 15,
               "plant + soil" = 18,
               "soil + microorgnism" = 8,
               "soil only" = 3)) +
  
  # 设置坐标系统
  coord_sf(default_crs = sf::st_crs(4326),  # WGS84坐标系
           xlim = c(-180, 180),            # 经度范围
           ylim = c(-90, 90)) +            # 纬度范围
  
  # 设置标题和标签
  labs(title = "Global Sampling Points Distribution",
       x = "Longitude", 
       y = "Latitude",
       color = "Test Type",
       shape = "Sample Type") +
  
  # 调整主题
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
        legend.position = "right")





# 4. 创建完整地图
###（有边框）
ggplot() +
  # 绘制世界地图背景（使用geom_sf）
  geom_sf(data = world, 
          fill = "lightgray",   # 国家填充色
          color = "white",      # 边界线颜色
          size = 0.2) +         # 边界线粗细
  
  # 添加采样点（使用geom_point）
  geom_point(data = data_for_map, 
             aes(x = longitude, y = latitude, 
                 color = test, shape = type),
             size = 3,          # 点大小
             alpha = 0.8) +     # 透明度
  
  # 设置颜色和形状的映射
  scale_color_manual(
    values = c("decrease only" = "#54d5c7",
               "increase only" = "#f65150",
               "decrease + increase" = "#edba38")) +
  
  scale_shape_manual(
    values = c("plant only" = 16,
               "microorgnism only" = 17,
               "plant + microorgnism" = 15,
               "plant + soil" = 18,
               "soil + microorgnism" = 8,
               "soil only" = 3)) +
  
  # 设置坐标系统
  coord_sf(default_crs = sf::st_crs(4326),  # WGS84坐标系
           xlim = c(-180, 180),            # 经度范围
           ylim = c(-90, 90)) +            # 纬度范围
  
  # 设置标题和标签
  labs(title = "Global Sampling Points Distribution",
       x = "Longitude", 
       y = "Latitude",
       color = "Test Type",
       shape = "Sample Type") +
  
  # 调整主题
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
        legend.position = "right",
        panel.background = element_rect(fill = "white"))  # 白色背景色



