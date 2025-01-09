-- 1. AR内容
CREATE TABLE AR_Content (
    content_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    url VARCHAR(255),
    description TEXT,
    qr_code_id INT
);

-- 2. 二维码
CREATE TABLE QR_Code (
    qr_code_id INT PRIMARY KEY,
    qr_code_image_url VARCHAR(255) NOT NULL
);

-- 3. 沙盘分区
CREATE TABLE Sandbox_Zone (
    zone_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    qr_code_id INT,
    factory_id INT
);

-- 4. 设备
CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    equipment_status VARCHAR(50),
    qr_code_id INT,
    factory_id INT
);

-- 5. 运维记录
CREATE TABLE Maintenance_Record (
    record_id INT PRIMARY KEY,
    maintenance_log TEXT,
    date DATE,
    maintainer_name VARCHAR(255),
    equipment_id INT
);

-- 6. 工厂
CREATE TABLE Factory (
    factory_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    contact_person VARCHAR(255),
    contact_phone VARCHAR(20),
    address VARCHAR(255)
);

-- 7. 能耗清单
CREATE TABLE Energy_Consumption (
    energy_id INT PRIMARY KEY,
    energy_amount DECIMAL(10, 2),
    unit VARCHAR(50),
    energy_type VARCHAR(50),  -- 'water', 'electricity', 'natural gas'
    year INT,
    month INT,
    factory_id INT
);

-- 8. 库区
CREATE TABLE Warehouse_Zone (
    zone_id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    factory_id INT
);

-- 9. 材料
CREATE TABLE Material (
    material_id INT PRIMARY KEY,
    material_name VARCHAR(255),
    material_model VARCHAR(255),
    material_description TEXT,
    stock_amount INT,
    warehouse_zone_id INT
);

-- 10. 材料出入库单
CREATE TABLE Material_Transaction (
    transaction_id INT PRIMARY KEY,
    transaction_type INT,  -- 0: 入库, 1: 出库
    operator_name VARCHAR(255),
    warehouse_admin_name VARCHAR(255)
);

-- 11. 材料清单明细
CREATE TABLE Material_Transaction_Detail (
    material_id INT,
    transaction_id INT,
    quantity INT,
    transaction_date DATE
);

-- 12. 供应批次
CREATE TABLE Supply_Batch (
    batch_id INT PRIMARY KEY,
    quantity INT,
    unit VARCHAR(50),
    production_date DATE,
    shelf_life INT,
    manufacturer VARCHAR(255),
    material_id INT
);

-- 13. 产品
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    product_model VARCHAR(255),
    product_description TEXT,
    stock_amount INT,
    warehouse_zone_id INT
);

-- 14. 产品出入库单
CREATE TABLE Product_Transaction (
    transaction_id INT PRIMARY KEY,
    transaction_type INT,  -- 0: 入库, 1: 出库
    operator_name VARCHAR(255),
    warehouse_admin_name VARCHAR(255)
);

-- 15. 产品清单明细
CREATE TABLE Product_Transaction_Detail (
    product_id INT,
    transaction_id INT,
    quantity INT,
    transaction_date DATE
);

-- 16. 生产批次
CREATE TABLE Production_Batch (
    batch_id INT PRIMARY KEY,
    quantity INT,
    unit VARCHAR(50),
    production_date DATE,
    product_id INT
);

-- 17. VR展厅
CREATE TABLE VR_Showroom (
    showroom_id INT PRIMARY KEY,
    showroom_name VARCHAR(255),
    description TEXT
);

-- 18. 展区
CREATE TABLE VR_Exhibit_Zone (
    exhibit_zone_id INT PRIMARY KEY,
    exhibit_zone_name VARCHAR(255),
    description TEXT,
    showroom_id INT
);

-- 19. 载体
CREATE TABLE VR_Carrier (
    carrier_id INT PRIMARY KEY,
    carrier_name VARCHAR(255),
    carrier_type INT,  -- 0: 展台, 1: 展板
    status VARCHAR(50),  -- '空置' or '展出'
    specifications TEXT,
    exhibit_zone_id INT
);

-- 20. VR内容
CREATE TABLE VR_Content (
    content_id INT PRIMARY KEY,
    content_name VARCHAR(255),
    category VARCHAR(100),  -- '文本', '图片', '动画', '声音和视频', '3D模型', 'VR场景'
    file_url VARCHAR(255),
    description TEXT,
    carrier_id INT,
    work_id INT
);

-- 21. 作品
CREATE TABLE VR_Work (
    work_id INT PRIMARY KEY,
    title VARCHAR(255),
    authors TEXT,  -- 用逗号分隔作者
    instructor VARCHAR(255),
    award_info TEXT,
    description TEXT
);

-- 22. 合作案例
CREATE TABLE Cooperation_Case (
    case_id INT PRIMARY KEY,
    case_name VARCHAR(255),
    cooperation_unit VARCHAR(255),
    description TEXT
);

-- 23. VR场景
CREATE TABLE VR_Scene (
    scene_id INT PRIMARY KEY,
    scene_name VARCHAR(255),
    file_url VARCHAR(255),
    description TEXT,
    case_id INT
);

-- 24. VR素材
CREATE TABLE VR_Material (
    material_id INT PRIMARY KEY,
    material_name VARCHAR(255),
    category VARCHAR(100),  -- '文本', '图片', '动画', '声音和视频', '3D模型', 'VR场景'
    file_url VARCHAR(255),
    description TEXT,
    scene_id INT
);
